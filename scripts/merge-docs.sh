#!/bin/bash
set -eux

cd docs
for file in $( ls *-docs.json ); do   
  URL="./api/$file"
  jq -n --arg file ${file} --arg url ${URL} '{"urls":[{"url": $url, "name": $file}]}' > tmp-sc-$file.json
done
jq -s '.[0].urls=([.[].urls]|add)|.[0]' tmp-sc-* > swagger-config.json
rm tmp-sc-*