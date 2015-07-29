. ./all.sh

export PKIIO_CMD="/usr/local/pki.io/bin/pki.io"

install_deps() {
  echo "*** Installing dependencies"
  sudo pkg install -y bash git curl
}

install_package() {
  echo "*** Installing package"
  cd "$TMPDIR/builds/"
  md5 -c "pki.io_${VERSION}_freebsd_amd64.tar.gz-md5sum"
  sha256 -c "pki.io_${VERSION}_freebsd_amd64.tar.gz-sha256sum"
  sudo tar zxvf "pki.io_${VERSION}_freebsd_amd64.tar.gz" -C /usr/local/
}
