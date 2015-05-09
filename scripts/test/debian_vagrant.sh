#!/bin/sh

set -eu

cd /vagrant/scripts/test

. ./debian.sh

setup_env() {
  echo *** Setting up environment
  cp -r /vagrant/tests "$TMPDIR/"
}

main
exit 0
