function http_code_to_text()
{
    case "$1" in
        000)
            echo "Unknown Response"
        ;;
        100)
            echo "Continue"
        ;;
        101)
            echo "Switching Protocols"
        ;;
        102)
            echo "Processing (WebDAV)"
        ;;
        103)
            echo "Checkpoint | Early Hints"
        ;;
        200)
            echo "Ok"
        ;;
        201)
            echo "Created"
        ;;
        202)
            echo "Accepted"
        ;;
        203)
            echo "Non-Authoritative Information"
        ;;
        204)
            echo "No Content"
        ;;
        205)
            echo "Reset Content"
        ;;
        206)
            echo "Partial Content"
        ;;
        207)
            echo "Multi-Status (WebDAV)"
        ;;
        208)
            echo "Already Reported (WebDAV)"
        ;;
        226)
            echo "IM Used"
        ;;
        300)
            echo "Multiple Choices"
        ;;
        301)
            echo "Moved Permanently"
        ;;
        302)
            echo "Found"
        ;;
        303)
            echo "See Other"
        ;;
        304)
            echo "Not Modified"
        ;;
        305)
            echo "Use Proxy"
        ;;
        306)
            echo "Switch Proxy"
        ;;
        307)
            echo "Temporary Redirect"
        ;;
        308)
            echo "Permanent Redirect"
        ;;
        400)
            echo "Bad Request"
        ;;
        401)
            echo "Unauthorized"
        ;;
        402)
            echo "Payment Required"
        ;;
        403)
            echo "Forbidden"
        ;;
        404)
            echo "Not Found"
        ;;
        405)
            echo "Method Not Allowed"
        ;;
        406)
            echo "Not Acceptable"
        ;;
        407)
            echo "Proxy Authentication Required"
        ;;
        408)
            echo "Request Timeout"
        ;;
        409)
            echo "Conflict"
        ;;
        410)
            echo "Gone"
        ;;
        411)
            echo "Length Required"
        ;;
        412)
            echo "Precondition Failed"
        ;;
        413)
            echo "Payload Too Large"
        ;;
        414)
            echo "URI Too Long"
        ;;
        415)
            echo "Unsupported Media Type"
        ;;
        416)
            echo "Range Not Satisfiable"
        ;;
        417)
            echo "Expectation Failed"
        ;;
        418)
            echo "I'm a teapot"
        ;;
        420)
            echo "Method Failure (Spring Framework) | Enhance Your Calm (Twitter)"
        ;;
        421)
            echo "Misdirected Request"
        ;;
        422)
            echo "Unprocessable Entity (WebDAV)"
        ;;
        423)
            echo "Locked (WebDAV)"
        ;;
        424)
            echo "Failed Dependency (WebDAV)"
        ;;
        426)
            echo "Upgrade Required"
        ;;
        428)
            echo "Precondition Required"
        ;;
        429)
            echo "Too Many Requests"
        ;;
        431)
            echo "Request Header Fields Too Large"
        ;;
        440)
            echo "Login Time-out (IIS)"
        ;;
        444)
            echo "No Response (nginx)"
        ;;
        449)
            echo "Retry With (IIS)"
        ;;
        450)
            echo "Blocked by Windows Parental Controls (Microsoft)"
        ;;
        451)
            echo "Unavailable For Legal Reasons | Redirect (IIS)"
        ;;
        495)
            echo "SSL Certificate Error (nginx)"
        ;;
        496)
            echo "SSL Certificate Required (nginx)"
        ;;
        497)
            echo "HTTP Request Sent to HTTPS Port (nginx)"
        ;;
        498)
            echo "Invalid Token (Esri)"
        ;;
        499)
            echo "Token Required (Esri) | Client Closed Request (nginx)"
        ;;
        500)
            echo "Internal Server Error"
        ;;
        501)
            echo "Not Implemented"
        ;;
        502)
            echo "Bad Gateway"
        ;;
        503)
            echo "Service Unavailable"
        ;;
        504)
            echo "Gateway Timeout"
        ;;
        505)
            echo "HTTP Version Not Supported"
        ;;
        506)
            echo "Variant Also Negotiates"
        ;;
        507)
            echo "Insufficient Storage (WebDAV)"
        ;;
        508)
            echo "Loop Detected (WebDAV)"
        ;;
        509)
            echo "Bandwidth Limit Exceeded (Apache Web Server / cPanel)"
        ;;
        510)
            echo "Not Extended"
        ;;
        511)
            echo "Network Authentication Required"
        ;;
        520)
            echo "Unknown Error (Cloudflare)"
        ;;
        521)
            echo "Web Server Is Down (Cloudflare)"
        ;;
        522)
            echo "Connection Timed Out (Cloudflare)"
        ;;
        523)
            echo "Origin Is Unreachable (Cloudflare)"
        ;;
        524)
            echo "A Timeout Occured (Cloudflare)"
        ;;
        525)
            echo "SSL Handshake Failed (Cloudflare)"
        ;;
        526)
            echo "Invalid SSL Certificate (Cloudflare)"
        ;;
        527)
            echo "Railgun Error (Cloudflare)"
        ;;
        530)
            echo "Site is frozen"
        ;;
        598)
            echo "Network read timeout error"
        ;;
        *)
            echo "Unknown HTTP-Status-Code !!!"
        ;;
    esac
}