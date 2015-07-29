#!/bin/sh

set -eu

. version.sh

./vagrant_freebsd_10.sh
./vagrant_debian_7.sh
./vagrant_centos_7.sh
