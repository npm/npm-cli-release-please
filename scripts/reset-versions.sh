#!/usr/bin/env bash

set -xe

export GITHUB_TOKEN=$(gh token)
if [ -z "$GITHUB_TOKEN" ]; then
  echo "No GITHUB_TOKEN was found"
  exit 1
fi

MAJOR=$1
TEST_BRANCH=template-oss-mock-testing-branch-do-not-delete

function update_release_please_config() {
  local TMP_RP_FILE=$(mktemp)
  jq $@ release-please-config.json > "$TMP_RP_FILE"
  mv "$TMP_RP_FILE" release-please-config.json
}

# show current versions
npm pkg get version -ws -iwr
cat .release-please-manifest.json

npm pkg set touch1=$RANDOM -ws -iwr
update_release_please_config --arg a "$(git rev-parse HEAD)" '."last-release-sha"=$a'
update_release_please_config --arg a "$MAJOR.0.0" '."release-as"=$a'
git add -A && git commit -m "fix: set release-as and last-release-sha"
git push origin $TEST_BRANCH

echo "Done"
