. ./skel.sh

#export VERSION="0.1.1"
export GO_VERSION="1.4.1"

setup_project() {
  export TMPDIR=$(mktemp -d)
  echo *** Changing to temp directory $TMPDIR
  cd "$TMPDIR"
}

install_bats() {
  echo *** Installing bats
  cd "$TMPDIR"
  if [ -z "$(which bats)" ]; then
    git clone https://github.com/sstephenson/bats.git
    cd bats
    sudo ./install.sh /usr/local
  fi
}

install_go() {
  echo *** Downloading and installing Go
  cd "$TMPDIR"
  if [ ! -d /usr/local/go ]; then
    test -e "$GO_PACKAGE" || curl -sO "https://storage.googleapis.com/golang/$GO_PACKAGE"
    tar -C /usr/local -xzf "$GO_PACKAGE"
  fi
}

install_fdm() {
  echo *** Installing fdm
  cd "$TMPDIR"
  mkdir fdm
  curl https://raw.githubusercontent.com/pki-io/fdm/master/fdm -o "fdm/fdm"
  chmod +x "fdm/fdm"
  export PATH="$PATH:$TMPDIR/fdm"
}

clone_source() {
  echo *** Cloning source
  cd "$TMPDIR"
  export SOURCEDIR="$TMPDIR/go/src/github.com/pki-io"
  mkdir -p "$SOURCEDIR"
  cd go
  export GOPATH=$(pwd)
  export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
  cd "$SOURCEDIR"
  test -d admin || git clone https://github.com/pki-io/admin.git
  cd admin
  if [[ "$VERSION" =~ "master" ]]; then
    git checkout master
  else
    git checkout "$VERSION"
  fi
}

build_source() {
  echo *** Building source
  cd "$SOURCEDIR/admin"
  make
}
