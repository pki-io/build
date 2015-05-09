. ./skel.sh

export VERSION="0.1.0-release1"

setup_project() {
  echo *** Changing to temp directory
  export TMPDIR=$(mktemp -d)
  cd "$TMPDIR"
}

install_bats() {
  echo *** Installing bats
  cd "$TMPDIR"
  git clone https://github.com/sstephenson/bats.git
  cd bats
  sudo ./install.sh /usr/local
}

clone_tests() {
  echo *** Cloning tests
  cd "$TMPDIR"
  test -d admin || git clone https://github.com/pki-io/admin.git
}

run_tests() {
  cd "$TMPDIR"
  echo *** Running package tests
  bats tests/

  echo *** Running tests from source
  export PKIIO_CMD="/opt/pki.io/bin/pki.io"
  bats admin/bats_tests/
}
