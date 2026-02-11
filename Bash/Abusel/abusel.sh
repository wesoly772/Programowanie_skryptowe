#!/bin/bash
ARGS=("ipAddress" "abuseConfidenceScore" "countryName" "domain" "totalReports")

#Checking reputation for an IP address

if [ -f "$1" ]; then
    IP=$(cat $1)
else
    IP="$@"
fi

echo "IP,ConfidenceScore,Country,Domain,TotalReports" > raport.csv

function check(){
    ip=$1
    QUERY=$(curl -s -G https://api.abuseipdb.com/api/v2/check \
  --data-urlencode "ipAddress=$ip" \
  -d maxAgeInDays=90 \
  -d verbose \
  -H "Key: acca343895ec6dd4a5ef26d155dd9dbebc7b2d978fe9e5752c3f53ada892f6177d6b280af23c81d6" \
  -H "Accept: application/json"
  )
    results=""
    for argu in ${ARGS[@]}; do
        results+="$(echo "$QUERY" | jq -r ".data.$argu"),"
    done
    results="${results%,}"
    echo $results >> raport.csv
}

for ip in ${IP[@]}; do
    echo "Checking ip: $ip..."
    check $ip
done

echo "Results saved to raport.csv"

