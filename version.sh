#!/bin/sh

CURRENT_STABLE="0.1.2-release1"
version="${1:-''}"
if [ "$version" != "" ]; then
  export VERSION="$version"
else
  export VERSION="$CURRENT_STABLE"
fi
