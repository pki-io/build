#!/bin/sh

set -eu

echo "Using version: $VERSION"

echo Starting freebsd 10 build box
vagrant up freebsd-10-build
echo Destroying freebsd 10 build box
vagrant destroy -f freebsd-10-build

echo Starting freebsd 10 test box
vagrant up freebsd-10-test
echo Destroying freebsd 10 test box
vagrant destroy -f freebsd-10-test
