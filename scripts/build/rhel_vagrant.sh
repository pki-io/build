#!/bin/sh

set -eu

cd /vagrant/scripts/build

. ./rhel.sh

publish_packages() {
  echo *** Publishing packages
  cd "$TMPDIR"
  mkdir -p /vagrant/builds/
  RPM_VERSION=$(echo "$VERSION" | sed 's/-/_/g')
  mv "pki.io-${RPM_VERSION}-1.x86_64.rpm" /vagrant/builds/
  cd /vagrant/builds
  md5sum "pki.io-${RPM_VERSION}-1.x86_64.rpm" > "pki.io-${RPM_VERSION}-1.x86_64.rpm-md5sum"
  sha256sum "pki.io-${RPM_VERSION}-1.x86_64.rpm" > "pki.io-${RPM_VERSION}-1.x86_64.rpm-sha256sum"
}

main
exit 0
