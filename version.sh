#!/bin/sh

CURRENT_STABLE="0.1.3-release1"
version=${1:-""}
if [ -n "$version" ]; then
  export VERSION="$version"
else
  export VERSION="$CURRENT_STABLE"
fi
