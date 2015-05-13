#!/bin/sh

set -eu

cd /vagrant/scripts/build

. ./freebsd.sh

publish_packages() {
  echo *** Publishing packages
  cd "$TMPDIR"
  mkdir -p /vagrant/builds/
  mv "opt/pki.io_${VERSION}_freebsd_amd64.tar.gz" /vagrant/builds/
  cd /vagrant/builds
  md5 -r "pki.io_${VERSION}_freebsd_amd64.tar.gz" > "pki.io_${VERSION}_freebsd_amd64.tar.gz-md5sum"
  sha256 -r "pki.io_${VERSION}_freebsd_amd64.tar.gz" > "pki.io_${VERSION}_freebsd_amd64.tar.gz-sha256sum"
}

main
exit 0
