#!/bin/bash

set -x
set -eo pipefail

cd ../template-oss
pwd

npm run template-oss-apply
npm pack --pack-destination=../npm-cli-release-please/scripts/ 2> /dev/null

cd ../npm-cli-release-please
pwd

rm -rf ./scripts/npmcli-template-oss.tgz
FILE=./$(find scripts -name "npmcli-template-oss-*")
mv $FILE ./scripts/npmcli-template-oss.tgz

npm i ./scripts/npmcli-template-oss.tgz -ws -iwr -D
npm run template-oss-apply
