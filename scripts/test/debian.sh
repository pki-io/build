. ./linux.sh

install_deps() {
  echo "*** Installing dependencies"
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y git
}

install_package() {
  echo "*** Installing package"
  cd "$TMPDIR/builds/"
  md5sum -c "pki.io_${VERSION}_amd64.deb-md5sum"
  sha256sum -c "pki.io_${VERSION}_amd64.deb-sha256sum"
  sudo dpkg -i "pki.io_${VERSION}_amd64.deb"
}
