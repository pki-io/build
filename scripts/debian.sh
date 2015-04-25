#!/bin/bash
set -e

GO_PACKAGE="go1.4.linux-amd64.tar.gz"

echo *** Installing dependencies
apt-get update
apt-get -y install git

echo *** Changing to temp directory
cd /tmp

echo *** Installing bats
git clone https://github.com/sstephenson/bats.git
cd bats
sudo ./install.sh /usr/local
cd ..

echo *** Downloading and installing Go
test -e $GO_PACKAGE || curl -sO https://storage.googleapis.com/golang/$GO_PACKAGE
tar -C /usr/local -xzf $GO_PACKAGE

echo *** Setting up the go project directory
mkdir -p go/src
cd go
export GOPATH=$(pwd)
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

echo *** Installing fdm
FDM_PATH="$HOME/fdm"
mkdir "$FDM_PATH"
curl https://raw.githubusercontent.com/pki-io/fdm/master/fdm -o "$FDM_PATH/fdm"
chmod +x "$FDM_PATH/fdm"
export PATH="$PATH:$FDM_PATH"

echo *** Cloning packages
cd src
test -d admin || git clone https://github.com/pki-io/admin.git

echo *** Building packages
cd admin
make && make install

echo *** Publishing binaries
mkdir -p /vagrant/build/debian-7.7
test -e pki.io && cp pki.io /vagrant/build/debian-7.7/

echo *** Done
exit 0
