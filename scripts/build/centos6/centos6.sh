#!/bin/sh
set -e
set -u
set -x

GO_PACKAGE=go1.4.1.linux-amd64.tar.gz
if [ -e *.rpm ]; then
	rm *.rpm
fi 
cp $HOME/$GO_PACKAGE ./
docker build -t=centos6 .
rm $GO_PACKAGE
docker run -it --rm -v `pwd`:/pki centos6 /bin/sh /pki/makeRPM.sh
