# Originally from https://stackoverflow.com/a/6174447/4419833
# Defines a variable prefixed "parse_url_" for each URL part (e.g. parse_url_protocol containing the protocol)

function parse_url()
{
    local full_url=$1

    # extract the protocol
    local protocol=$(echo ${full_url} | grep :// | sed -e 's,^\(.*://\).*,\1,g')

    parse_url_protocol=$(echo ${protocol} | cut -d : -f 1)

    # URL without protocol
    local url=$(echo ${full_url} | sed -e "s,${protocol},,g")

    # extract the user (if any)
    parse_url_user=$(echo ${url} | grep @ | cut -d @ -f1)

    # Host with port
    local host=$(echo ${url} | sed -e "s,${parse_url_user}@,,g" | cut -d / -f 1)

    # Extract the host
    parse_url_host=$(echo ${host} | cut -d : -f 1)

    # Extract the port (if any)
    parse_url_port=$(echo ${host} | sed -e "s,^.*:,:,g" -e "s,.*:\([0-9]*\).*,\1,g" -e "s,[^0-9],,g")

    # Extract the path (if any)
    parse_url_path=$(echo ${url} | grep / | cut -d / -f2-)
}