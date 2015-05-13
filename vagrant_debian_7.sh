#!/bin/sh

set -eu

echo Starting debian 7 build box
vagrant up debian-7-build
echo Destroying debian 7 build box
vagrant destroy -f debian-7-build

echo Starting debian 7 test box
vagrant up debian-7-test
echo Destroying debian 7 test box
vagrant destroy -f debian-7-test
