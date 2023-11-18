#!/bin/sh

echo $RANDOM | md5sum | head -c 20 >> AUTHORS
echo >> AUTHORS
echo "$(echo $RANDOM | md5sum | head -c 20)-woo2" >> AUTHORS
