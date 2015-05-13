. ./linux.sh

install_deps() {
  echo *** Installing dependencies
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y git ruby build-essential ruby-dev curl
  sudo gem install fpm --no-ri --no-rdoc
}

build_packages() {
  echo *** Building packages
  cd "$TMPDIR"
  if [ -e opt ]; then
    rm -fr opt
  fi
  mkdir -p opt/pki.io/bin
  cp "$SOURCEDIR/admin/pki.io" opt/pki.io/bin/
  chmod +x opt/pki.io/bin/pki.io

  echo *** Building Deb
  fpm -s dir -t deb -v "$VERSION" -n pki.io opt

  echo *** Building tar.gz
  cd opt
  tar czvf "pki.io_${VERSION}_linux_amd64.tar.gz" pki.io
}
