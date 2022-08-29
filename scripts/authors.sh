#!/bin/sh

git log --use-mailmap --reverse --format='%aN <%aE>' | grep -v -e "\[bot\]" -e "^npm team" -e "^npm CLI robot" | perl -wnE '
BEGIN {}
print $seen{$_} = $_ unless $seen{$_}
' > AUTHORS
