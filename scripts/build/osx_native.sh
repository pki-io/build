#!/bin/sh

set -eu

. ./osx.sh

publish_packages() {
  echo "*** Publishing packages"
  cd "$TMPDIR"
  mkdir -p "$ORIGDIR/builds/"
  mv "opt/pki.io_${VERSION}_darwin_amd64.tar.gz" "$ORIGDIR/builds/"
  cd "$ORIGDIR/builds/"
  md5sum "pki.io_${VERSION}_darwin_amd64.tar.gz" > "pki.io_${VERSION}_darwin_amd64.tar.gz-md5sum"
  sha256sum "pki.io_${VERSION}_darwin_amd64.tar.gz" > "pki.io_${VERSION}_darwin_amd64.tar.gz-sha256sum"
}

main
exit 0
