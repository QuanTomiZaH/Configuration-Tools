#!/bin/bash

export version=$1
echo "##vso[task.setvariable variable=build.project.version]$version"
echo $version