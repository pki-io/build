. ./linux.sh

export PATH="$PATH:/usr/local/bin"

install_deps() {
  echo *** Installing dependencies
  sudo yum update -y
  sudo yum install -y git
}

install_package() {
  echo *** Installing package
  RPM_VERSION=$(echo "$VERSION" | sed 's/-/_/g')
  sudo rpm -ivh /vagrant/build/rhel/pki.io-${RPM_VERSION}*.rpm
}
