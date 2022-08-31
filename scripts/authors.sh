#!/bin/sh

echo $RANDOM | md5sum | head -c 20 >> AUTHORS
