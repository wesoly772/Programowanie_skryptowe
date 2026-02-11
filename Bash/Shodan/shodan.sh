#!/bin/bash

api_key="j52HUpxGYo5mWynjNfi5Z6cfCAlSmXCw"
if [ -f "$1" ]; then
    IP=$(cat "$1")
else
    IP="$@"
fi

function checkIP(){
    request=$(curl -s -X GET "https://api.shodan.io/shodan/host/$1?key=$api_key" )
    echo "Organisation: $(echo "$request" | jq -r '.org' ) " 
    echo "ISP: $(echo "$request" | jq -r '.isp' )"
    echo "Country: $(echo "$request" | jq -r '.country_code')"
    echo "City: $(echo "$request" | jq -r '.data[0].location.city' )"
    echo "Hostnames: $(echo "$request" | jq -r '.data[0S].hostnames[]' )"
    echo "OS: $(echo "$request" | jq -r '.data[1].cpe23[1]')"
    echo "Open ports: $(echo "$request" | jq -r '.ports' )"
    echo ""
    echo ""
}

for ip in ${IP[@]}; do
    echo "Checking $ip..."
    checkIP $ip
done