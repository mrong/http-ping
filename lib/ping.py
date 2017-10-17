import os
import subprocess
import sys
import time
from http.client import responses
from urllib.parse import urlparse


class Ping:
    def __init__(self, url, timeout, additional_curl_options, ipv4_only, ipv6_only, verbose):
        self.url = url
        self.parsed_url = urlparse(url)
        self.timeout = timeout
        self.additional_curl_options = additional_curl_options
        self.ipv4_only = ipv4_only
        self.ipv6_only = ipv6_only
        self.verbose = verbose

        self.successful_requests = 0
        self.failed_requests = 0
        self.total_time = 0
        self.request_no = 0

        self.curl_env = {}
        for key, value in os.environ.items():
            if key.startswith("LC_") or key.startswith("LANG"):
                self.print_verbose("Ignoring environment variable: {}".format(key))
                continue

            self.curl_env[key] = value

    def calculate_stats(self):
        total_requests = self.successful_requests + self.failed_requests
        average_time = self.total_time / total_requests
        successful_requests_percentage = self.successful_requests / total_requests * 100
        failed_requests_percentage = self.failed_requests / total_requests * 100

        return {
            "total_requests": total_requests,
            "successful_requests": self.successful_requests,
            "successful_requests_percentage": successful_requests_percentage,
            "failed_requests": self.failed_requests,
            "failed_requests_percentage": failed_requests_percentage,
            "average_time": average_time
        }

    def do_request(self, ip=None):
        self.request_no += 1

        curl_options = [
            "-w", "%{http_code} %{time_total} %{remote_ip}",
            "-o", "/dev/null",
            "-s"
        ]

        if self.timeout:
            curl_options.append("--max-time")
            curl_options.append(self.timeout)

        if self.ipv4_only:
            curl_options.append("--ipv4")

        if self.ipv6_only:
            curl_options.append("--ipv6")

        if ip:
            host, port = self.parsed_url.netloc.split(":") + [None]

            if port is None:
                scheme = self.parsed_url.scheme

                if scheme == "http":
                    port = 80
                elif scheme == "https":
                    port = 443

            curl_options.append("--resolve")
            curl_options.append("{}:{}:{}".format(host, port, ip))

        if self.additional_curl_options:
            curl_options += self.additional_curl_options

        curl_command = ["curl"] + curl_options + [self.url]

        self.print_verbose("Curl command: {}".format(" ".join(curl_command)))

        start_time = time.time()

        process = subprocess.run(curl_command, stdout=subprocess.PIPE, env=self.curl_env)

        curl_output = process.stdout.decode("utf-8").split()

        if len(curl_output) == 3:
            http_code, request_time, used_ip = curl_output

            http_code = int(http_code)
            request_time = float(request_time)

            if http_code in responses:
                description = responses[http_code]
            else:
                description = "Unknown response"
        else:
            http_code = 0
            request_time = time.time() - start_time
            used_ip = ip
            description = "Curl failed ({})".format(process.returncode)

        self.total_time += request_time

        if 100 <= http_code <= 399:
            self.successful_requests += 1
        else:
            self.failed_requests += 1

        if used_ip is None:
            used_ip = "N/A"

        return {
            "request_no": self.request_no,
            "ip": used_ip,
            "status": http_code,
            "time": round(request_time, 2),
            "description": description,
        }

    def print_verbose(self, *args):
        if not self.verbose:
            return

        print(*args, file=sys.stderr)
