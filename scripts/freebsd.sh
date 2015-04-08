#!/bin/sh
set -eu

GO_PACKAGE="go1.4.1.freebsd-amd64.tar.gz"

echo *** Installing dependencies
sudo pkg install -y git

echo *** Changing to temp directory
cd /tmp
BUILD_DIR=go-build.$$
mkdir $BUILD_DIR
cd $BUILD_DIR
echo *** Downloading and installing Go
test -e $GO_PACKAGE || curl -sO https://storage.googleapis.com/golang/$GO_PACKAGE
sudo tar -C /usr/local -xzf $GO_PACKAGE
export PATH=$PATH:/usr/local/go/bin

echo *** Changing to go project directory
mkdir -p go/src
cd go
export GOPATH=`pwd`

echo *** Getting libraries
go get "github.com/docopt/docopt-go"
go get "github.com/xeipuuv/gojsonschema"
go get "github.com/BurntSushi/toml"

echo *** Cloning packages
cd src
test -d core || git clone https://github.com/pki-io/core.git
test -d admin || git clone https://github.com/pki-io/admin.git

echo *** Building packages
cd core
make
cd ..
cd admin
make # && make install
cd ..

echo *** Done
exit 0
