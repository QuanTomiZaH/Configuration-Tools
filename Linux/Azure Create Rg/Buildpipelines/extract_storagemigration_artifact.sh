#!/bin/bash

# $1 is the $(Build.SourcesDirectory), this is the root location of the project directory

mkdir $1/<path>
unzip -o $1/<path>/storage.migration-*.zip -d $1/<path>
