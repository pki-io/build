#!/bin/sh

set -eu

cd /vagrant/scripts/build

. ./debian.sh

publish_packages() {
  echo *** Publishing packages
  cd "$TMPDIR"
  mkdir -p /vagrant/builds/
  mv "pki.io_${VERSION}_amd64.deb" /vagrant/builds/
  mv "opt/pki.io_${VERSION}_linux_amd64.tar.gz" /vagrant/builds/
  cd /vagrant/builds
  md5sum "pki.io_${VERSION}_amd64.deb" > "pki.io_${VERSION}_amd64.deb-md5sum"
  sha256sum "pki.io_${VERSION}_amd64.deb" > "pki.io_${VERSION}_amd64.deb-sha256sum"
  md5sum "pki.io_${VERSION}_linux_amd64.tar.gz" > "pki.io_${VERSION}_linux_amd64.tar.gz-md5sum"
  sha256sum "pki.io_${VERSION}_linux_amd64.tar.gz" > "pki.io_${VERSION}_linux_amd64.tar.gz-sha256sum"
}

main
exit 0
