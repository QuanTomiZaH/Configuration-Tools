#!/bin/bash

# root pom
mvn -B deploy:deploy-file \
  -DrepositoryId=${PUBLIC_FEED_ID} \
  -Durl=${PUBLIC_FEED_URL} \
  -Dpackaging=pom \
  -DgeneratePom=false \
	-Dfile=./.flattened-pom.xml \
	-DpomFile=./.flattened-pom.xml
