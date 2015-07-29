#!/bin/sh

set -eu

. version.sh

export ORIGDIR="$PWD"

cd scripts/build
./osx_native.sh
cd ../test
./osx_native.sh

