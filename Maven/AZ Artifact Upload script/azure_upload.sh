ARTIFACT_ID=""
GROUP_ID=""
VERSION=""
PACKAGING=""

# Below you can add a classifier, if no classifier is used. Then the main artifact is uploaded.
# CLASSIFIER="sources"
# CLASSIFIER="tests"
# CLASSIFIER="test-sources"

if [ -z "$CLASSIFIER" ]; then

	mvn deploy:deploy-file \
	-Dpackaging="${PACKAGING}" \
	-DrepositoryId="<add Repo ID>" \
	-Durl="<Add Repo URL>" \
	-DgroupId="${GROUP_ID}" \
	-DartifactId="${ARTIFACT_ID}" \
	-Dversion="${VERSION}" \
	-Dfile="${ARTIFACT_ID}-${VERSION}.${PACKAGING}"

else

	mvn deploy:deploy-file \
	-Dpackaging="${PACKAGING}" \
	-DrepositoryId="<Add Repo ID>" \
	-Durl="<Add Repo URL>" \
	-DgroupId="${GROUP_ID}" \
	-DartifactId="${ARTIFACT_ID}" \
	-Dversion="${VERSION}" \
	-Dfile="${ARTIFACT_ID}-${VERSION}-${CLASSIFIER}.${PACKAGING}" \
	-Dclassifier="${CLASSIFIER}" \
	-DgeneratePom=false

fi