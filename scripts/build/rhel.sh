. ./linux.sh

export PATH="$PATH:/usr/local/bin"

install_deps() {
  echo "*** Installing dependencies"
  sudo yum update -y 
  sudo yum groupinstall -y 'Development Tools'
  sudo yum install -y git curl ruby ruby-devel rubygems
  sudo gem install fpm --no-ri --no-rdoc
}

build_packages() {
  echo "*** Building packages"
  cd "$TMPDIR"
  if [ -e opt ]; then
    rm -fr opt
  fi
  mkdir -p opt/pki.io/bin
  cp "$SOURCEDIR/admin/pki.io" opt/pki.io/bin/
  chmod +x opt/pki.io/bin/pki.io

  echo "*** Building RPM"
  fpm -s dir -t rpm -v "$VERSION" -n pki.io opt
}
