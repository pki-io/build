. ./all.sh

export PKIIO_CMD="/usr/local/pki.io/bin/pki.io"

install_package() {
  echo *** Installing package
  if [ ! -d /usr/local/pki.io ]; then
    cd "$TMPDIR"/builds
    md5sum -c "pki.io_${VERSION}_darwin_amd64.tar.gz-md5sum"
    sha256sum -c "pki.io_${VERSION}_darwin_amd64.tar.gz-sha256sum"
    sudo tar zxvf "pki.io_${VERSION}_darwin_amd64.tar.gz" -C /usr/local/
  fi
}
