#!/bin/sh
set -eu
VERSION=0.1
# sanity checks
OS=`uname`
if [ $OS != "Linux" ]
then
      echo "You need to run this script on Linux"
      exit 1
fi
#if [ "$(id -u)" -ne "0" ]
#then
#    echo "This script requires root privileges" >&2
#    exit 1
#fi
#TODO - check if bats is already installed

GO_PACKAGE="go1.4.linux-amd64.tar.gz"
MAGIC=$(pwd)
echo *** Changing to temp directory
cd /tmp
BUILD_DIR=`mktemp -d`
ROOT_DIR=`mktemp -d`
cd $BUILD_DIR

echo *** Installing fdm
FDM_PATH="$HOME/fdm"
if [ ! -e $FDM_PATH ]; then
	mkdir "$FDM_PATH"
	curl https://raw.githubusercontent.com/pki-io/fdm/master/fdm -o "$FDM_PATH/fdm"
	chmod +x "$FDM_PATH/fdm"
fi
export PATH="$PATH:$FDM_PATH"


if [ ! -e $HOME/$GO_PACKAGE ]; then
	echo *** Downloading and installing Go
	curl -sO https://storage.googleapis.com/golang/$GO_PACKAGE
	cp $GO_PACKAGE $HOME
else
	echo *** $GO_PACKAGE found at $HOME
	cp $HOME/$GO_PACKAGE $BUILD_DIR
fi
tar -xzf $GO_PACKAGE
echo *** Setting up the go project directory
mkdir -p go/src
cd go
export GOPATH=$(pwd)
#export GOROOT=$ROOT_DIR
export GOROOT=$BUILD_DIR/go
OLD_PATH=$PATH
export PATH=$PATH:$BUILD_DIR/go/bin:$GOPATH/bin:$GOROOT/bin
go env
echo *** Cloning packages
pwd
cd src
test -d admin || git clone https://github.com/pki-io/admin.git
echo *** Building binaries
cd admin
make
test -e pki.io && cp pki.io $MAGIC
cd $MAGIC
echo *** Cleaning up
rm -fr $BUILD_DIR
rm -fr $ROOT_DIR
export PATH=$OLD_PATH
echo *** Creating directory structure
if [ -e opt ]; then
	rm -fr opt
fi
mkdir -p opt/pki.io/bin
cp $MAGIC/pki.io opt/pki.io/bin/pki.io
echo *** Creating RPM
fpm -s dir -t rpm -v $VERSION -n pki.io opt 

