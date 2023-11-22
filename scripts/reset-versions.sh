#!/usr/bin/env bash

set -e

export GITHUB_TOKEN=$(gh token)
if [ -z "$GITHUB_TOKEN" ]; then
  echo "No GITHUB_TOKEN was found"
  exit 1
fi

set -x

MAJOR=$1
TEST_BRANCH=template-oss-mock-testing-branch-do-not-delete

function update_release_please_config() {
  local TMP_RP_FILE=$(mktemp)
  jq $@ release-please-config.json > "$TMP_RP_FILE"
  mv "$TMP_RP_FILE" release-please-config.json
}

function reset_release_please_config() {
  update_release_please_config 'del(."release-as")'
  update_release_please_config 'del(."last-release-sha")'
  update_release_please_config 'del(.prerelease)'
  update_release_please_config 'del(."versioning")'
  update_release_please_config 'del(.packages.".".prerelease)'
  update_release_please_config 'del(.packages."."."versioning")'
  update_release_please_config 'del(.packages.pkg1.prerelease)'
  update_release_please_config 'del(.packages.pkg1."versioning")'
  update_release_please_config 'del(.packages.pkg2.prerelease)'
  update_release_please_config 'del(.packages.pkg2."versioning")'
  update_release_please_config 'del(.packages.pkg3.prerelease)'
  update_release_please_config 'del(.packages.pkg3."versioning")'
  update_release_please_config 'del(.packages."workspaces/arbitrary-name".prerelease)'
  update_release_please_config 'del(.packages."workspaces/arbitrary-name"."versioning")'
  update_release_please_config 'del(.packages."workspaces/not-the-name".prerelease)'
  update_release_please_config 'del(.packages."workspaces/not-the-name"."versioning")'
  update_release_please_config 'del(.packages."workspaces/pkg6".prerelease)'
  update_release_please_config 'del(.packages."workspaces/pkg6"."versioning")'
  git_add_and_commit "chore: reset release please config" || true
}

function git_add_and_commit() {
  if [ "$DRY_RUN" == "true" ]; then
    echo "Dry run, not committing"
  else 
    git add -A && git commit -m "$1"
  fi
}

function git_push() {
  git push origin $TEST_BRANCH
}

function update_pkg() {
  npm pkg set touch1=$RANDOM $@
}

function get_pr() {
  local PR=$(gh pr list --label="autorelease: pending" --base="$TEST_BRANCH" --json number | jq '.[0].number')
  echo $PR
}

# show current versions
npm pkg get version -ws -iwr
cat .release-please-manifest.json

update_pkg -ws -iwr
update_release_please_config --arg a "$(git rev-parse HEAD)" '."last-release-sha"=$a'
update_release_please_config --arg a "$MAJOR.0.0" '."release-as"=$a'
git_add_and_commit "fix: set release-as and last-release-sha"

# git_push
# run create PR

# gh pr merge $(get_pr) --rebase
# run create PR
# reset_release_please_config
# git pull
# git_push

echo "Done"
