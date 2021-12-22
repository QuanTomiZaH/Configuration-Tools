#!/bin/bash

# if there is not maven zip on the specific location on the system, the script will download the maven zip


if [ -e "$1/maven/apache-maven-3.6.0-bin.zip" ]
then
  echo 'The maven zip is already available on the system. Skipping download.'
else
  mkdir "$1/maven"
  wget https://archive.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip -P "$1/maven"
fi

echo "##vso[task.setvariable variable=maven_location]$1/maven/apache-maven-3.6.0-bin.zip"