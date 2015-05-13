#!/bin/sh

set -eu

. ./osx.sh

setup_env() {
  echo *** Setting up environment
  cp -r "$ORIGDIR/tests" "$TMPDIR/"
  cp -r "$ORIGDIR/builds" "$TMPDIR/"
}

main
exit 0
