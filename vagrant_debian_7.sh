#!/bin/sh

set -eu

echo Starting build box
vagrant up debian-7-build
echo Destroying build box
vagrant destroy -f debian-7-build

echo Starting test box
vagrant up debian-7-test
echo Destroying test box
vagrant destroy -f debian-7-test
