#!/bin/bash

# if there is not openjdk tar on the specific location on the system, the script will download the openjdk tar


if [ -e "$1/openjdktar/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz" ]
then
  echo 'The OpenJDK11U is already available on the system. Skipping download.'
else
  mkdir "$1/openjdktar"
  wget https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.10%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz -P "$1/openjdktar"
fi

echo "##vso[task.setvariable variable=jdk_location]$1/openjdktar/OpenJDK11U-jdk_x64_linux_hotspot_11.0.10_9.tar.gz"