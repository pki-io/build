#!/bin/bash
set -e

GO_PACKAGE="go1.4.linux-amd64.tar.gz"

echo *** Installing dependencies
apt-get -y install git

echo *** Changing to temp directory
cd /tmp

echo *** Downloading and installing Go
test -e $GO_PACKAGE || curl -sO https://storage.googleapis.com/golang/$GO_PACKAGE
tar -C /usr/local -xzf $GO_PACKAGE
export PATH=$PATH:/usr/local/go/bin

echo *** Changing to go project directory
mkdir -p go/src
cd go
export GOPATH=$(pwd)

echo *** Getting libraries
go get "github.com/docopt/docopt-go"
go get "github.com/xeipuuv/gojsonschema"
go get "github.com/BurntSushi/toml"

echo *** Cloning packages
cd src
test -d pki.io || git clone https://github.com/pki-io/pki.io.git
test -d admin || git clone https://github.com/pki-io/admin.git

echo *** Building packages
cd admin
git checkout fscott-cli
make && make install
cd ..

echo *** Publishing binaries
mkdir -p /vagrant/build/debian-7.7
test -e admin/pki.io && cp admin/pki.io /vagrant/build/debian-7.7/

echo *** Done
exit 0
