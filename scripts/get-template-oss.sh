#!/bin/bash

set -x
set -eo pipefail

rm -rf ./scripts/npmcli-template-oss*.tgz

cd ../template-oss
pwd

npm pack --pack-destination=../npm-cli-release-please/scripts/ 2> /dev/null

cd ../npm-cli-release-please
pwd

FROM_FILE=$(find scripts -name "npmcli-template-oss-*")
TO_FILE="scripts/npmcli-template-oss-$RANDOM.tgz"
mv ./$FROM_FILE ./$TO_FILE

npm rm @npmcli/template-oss
npm i ./$TO_FILE -ws -iwr -D --ignore-scripts

if [[ "$1" == "apply" ]]; then
  npm run template-oss-apply
fi
