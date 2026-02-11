#!/bin/bash

#input 
read -p "Podaj nazwe/sciezke do pliku:  " file

#hash
sum=$(sha256sum $file )
echo "Hash(sha256): $sum"


#Send file 
UPLOAD=$(curl --request POST \
     --url https://www.virustotal.com/api/v3/files \
     --header 'accept: application/json' \
     --header 'content-type: multipart/form-data' \
     --header 'x-apikey: f5269e38dd5a80f21f792c7ff31afd13fcc58aceba453f260abe388bd380850f' \
     --form file="@$file")


#Get file ID
ID=$(echo "$UPLOAD" | jq -r '.data.id')


echo "Waiting for the results..."

#Get analysis info
ANALIZA=$(curl --request GET \
     --url https://www.virustotal.com/api/v3/analyses/$ID \
     --header 'accept: application/json' \
     --header 'x-apikey: f5269e38dd5a80f21f792c7ff31afd13fcc58aceba453f260abe388bd380850f')
STATUS=$(echo $ANALIZA | jq -r '.data.attributes.status')

#Waiting for scan to end
while [ "$STATUS" = "queued" ]; do
    ANALIZA=$(curl -s --request GET \
     --url https://www.virustotal.com/api/v3/analyses/$ID \
     --header 'accept: application/json' \
     --header 'x-apikey: f5269e38dd5a80f21f792c7ff31afd13fcc58aceba453f260abe388bd380850f')
     STATUS=$(echo $ANALIZA |jq -r '.data.attributes.status')
     sleep 30
done


#Get info
THREATS=$(echo "$ANALIZA" | jq '.data.attributes.stats.malicious')

if [ "$THREATS" -gt 0 ]; then
    echo "The File is possibly malicious! Threats: $THREATS"
else
    echo "The file is probably safe."
fi