#!/bin/sh

set -eu

cd /vagrant/scripts/test

. ./freebsd.sh

setup_env() {
  echo *** Setting up environment
  cp -r /vagrant/tests "$TMPDIR/"
  cp -r /vagrant/builds "$TMPDIR/"
}

main
exit 0
