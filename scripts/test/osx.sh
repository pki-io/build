. ./all.sh

echo "Setting PKIIO_CMD to ${TMPDIR}/pki.io/bin/pki.io"
export PKIIO_CMD="${TMPDIR}/pki.io/bin/pki.io"

install_package() {
  echo "*** Installing package to $TMPDIR"
  cd "${TMPDIR}/builds"
  md5sum -c "pki.io_${VERSION}_darwin_amd64.tar.gz-md5sum"
  sha256sum -c "pki.io_${VERSION}_darwin_amd64.tar.gz-sha256sum"
  tar zxvf "pki.io_${VERSION}_darwin_amd64.tar.gz" -C $TMPDIR
}
