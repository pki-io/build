#!/bin/sh
set -e
set -u

GO_PACKAGE=go1.4.1.linux-amd64.tar.gz
if [ -e *.deb ]; then
	rm *.deb
fi 
cp $HOME/$GO_PACKAGE ./
docker build -t=debian_jessie .
rm $GO_PACKAGE
docker run -it --rm -v `pwd`:/pki debian_jessie /bin/sh /pki/makeDeb.sh
