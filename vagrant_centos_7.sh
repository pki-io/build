#!/bin/sh

set -eu

echo Starting centos 7 build box
vagrant up centos-7-build
echo Destroying centos 7 build box
vagrant destroy -f centos-7-build

echo Starting centos 7 test box
vagrant up centos-7-test
echo Destroying centos 7 test box
vagrant destroy -f centos-7-test
