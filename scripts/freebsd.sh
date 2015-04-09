#!/bin/sh
set -eu

GO_PACKAGE="go1.4.1.freebsd-amd64.tar.gz"
MAGIC=$(pwd)
echo *** Installing dependencies
sudo pkg install -y git
echo *** Changing to temp directory
cd /tmp
mkdir build.$$
cd build.$$
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
go get github.com/mattn/gom
echo *** Cloning packages
cd src
test -d admin || git clone https://github.com/pki-io/admin.git
echo *** Building binaries
cd admin
make
test -e pki.io && cp pki.io $MAGIC
rm -fr /tmp/build.$$
