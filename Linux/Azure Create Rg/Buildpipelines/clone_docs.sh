echo "Source branch: ${BUILD_SOURCEBRANCH}"
echo "Source dir:    ${BUILD_SOURCESDIRECTORY}"

if [[ ${BUILD_SOURCEBRANCH} == refs/heads/feature/* ]] || [[ ${BUILD_SOURCEBRANCH} == refs/heads/dev/* ]];then
  DOCS_BRANCH=refs/heads/develop
elif [[ ${BUILD_SOURCEBRANCH} == refs/heads/mstr/* ]]; then
  DOCS_BRANCH=refs/heads/master
fi

echo "Using branch: <location name>"

git clone --single-branch --branch "$(echo <location name> | cut -c12-)" https://${SYSTEM_ACCESSTOKEN}@<path> <buildlocation>