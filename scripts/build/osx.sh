. ./all.sh

export GO_PACKAGE="go${GO_VERSION}.darwin-amd64-osx10.8.tar.gz"

build_packages() {
  echo *** Building packages
  cd "$TMPDIR"
  if [ -e opt ]; then
    rm -fr opt
  fi
  mkdir -p opt/pki.io/bin
  cp "$SOURCEDIR/admin/pki.io" opt/pki.io/bin/
  chmod +x opt/pki.io/bin/pki.io

  echo *** Building tar.gz
  cd opt
  tar czvf "pki.io_${VERSION}_darwin_amd64.tar.gz" pki.io
}
