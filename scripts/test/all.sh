. ./skel.sh

export VERSION="0.1.0-release1"

setup_project() {
  echo *** Changing to temp directory
  export TMPDIR=$(mktemp -d)
  cd "$TMPDIR"
}

install_bats() {
  echo *** Installing bats
  if [ -z "$(which bats)" ]; then
    cd "$TMPDIR"
    git clone https://github.com/sstephenson/bats.git
    cd bats
    sudo ./install.sh /usr/local
  fi
}

clone_tests() {
  echo *** Cloning tests
  cd "$TMPDIR"
  test -d admin || git clone https://github.com/pki-io/admin.git
  cd admin
  git checkout "$VERSION"
}

run_tests() {
  cd "$TMPDIR"

  # all.bats is a workaround to get things working on FreeBSD
  echo *** Running package tests
  cat tests/*.bats > tests/all.bats
  bats tests/all.bats
  rm tests/all.bats

  echo *** Running tests from source
  cat admin/bats_tests/*.bats > admin/bats_tests/all.bats
  bats admin/bats_tests/all.bats
  rm admin/bats_tests/all.bats
}
