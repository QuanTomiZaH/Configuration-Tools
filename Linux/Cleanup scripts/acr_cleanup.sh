#!/bin/bash
# $1 - version
# $2 - dryrun option

version="$1"


if [[ $2 == 'True' ]]
then
    action="--dry-run"
else
    action=''
fi

echo "image deletion of tag version" $version $action

az acr run --registry chdevmaster \
  --cmd "acr purge \
  --filter '<name>:$version' '<name>:$version-<name>' \
  --filter '<name>:$version' \
  --filter '<name>:$version' \
  --filter '<name>:$version' --ago 0d $action"  /dev/null