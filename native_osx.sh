#!/bin/sh

set -eu

mode="${1:-''}"
if [ "$mode" == "dev" ]; then
  export VERSION="0.1.1-master"
else
  export VERSION="0.1.1"
fi

export ORIGDIR="$PWD"

cd scripts/build
./osx_native.sh
cd ../test
./osx_native.sh

