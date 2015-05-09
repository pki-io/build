. ./linux.sh

install_deps() {
  echo *** Installing dependencies
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install -y git
}

install_package() {
  echo *** Installing package
  sudo dpkg -i /vagrant/build/debian/pki.io_${VERSION}_*.deb
}
