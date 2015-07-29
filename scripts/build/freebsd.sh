. ./all.sh

export GO_PACKAGE="go${GO_VERSION}.freebsd-amd64.tar.gz"

OS=`uname`
if [ $OS != "FreeBSD" ]
then
  echo "You need to run this script on FreeBSD"
  exit 1
fi

#if [ "$(id -u)" -ne "0" ]
#then
#  echo "This script requires root privileges" >&2
#  exit 1
#fi

install_deps() {
  echo "*** Installing dependencies"
  sudo pkg install -y bash git curl
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

  echo "*** Building tar.gz"
  cd opt
  tar czvf "pki.io_${VERSION}_freebsd_amd64.tar.gz" pki.io
}
