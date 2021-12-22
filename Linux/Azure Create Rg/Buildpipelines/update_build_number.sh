#!/bin/bash

# $1 is the release_version if available

if [ "$1" == "none" ]; then

  export version=$(mvn org.apache.maven.plugins:maven-help-plugin:3.2.0:evaluate -Dexpression=project.version -q -DforceStdout)

else

  export version=$1

fi

export build_number=$(echo "$BUILD_BUILDNUMBER-$version" | tr '[:upper:]' '[:lower:]')
echo "##vso[build.updatebuildnumber]$build_number"
echo "##vso[task.setvariable variable=maven_version]$version"