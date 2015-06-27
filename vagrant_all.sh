#!/bin/sh

set -eu

mode="${1:-''}"
if [ "$mode" == "dev" ]; then
  export VERSION="0.1.1-master"
else
  export VERSION="0.1.1-release1"
fi

./vagrant_freebsd_10.sh
./vagrant_debian_7.sh
./vagrant_centos_7.sh
