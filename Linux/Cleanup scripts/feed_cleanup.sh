#!/bin/bash
# $1 - version
# $2 - dryrun option
# $3 - Feed PAT

version="$1"


B64_PAT=$(printf "%s"":$3" | base64)

if [[ $2 == 'True' ]]
then
    action="GET"
    echo "Dryrun of feeds deletion" $version  
else
    action='DELETE'
    echo "feed deletion version" $version 
fi

while read line || [[ $line ]]; do
  IFS=':'
  read -ra ADDR <<<"$line"
  curl -X $action -H "Content-Type: application/json" \
    -H "Authorization: Basic $B64_PAT" \
    <path>/"${ADDR[0]}"/artifacts/"${ADDR[1]}"/versions/"$version"?api-version=6.0-preview.1  | jq -r
done < ./<path>.txt