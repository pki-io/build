. ./linux.sh

export PATH="$PATH:/usr/local/bin"

install_deps() {
  echo *** Installing dependencies
  sudo yum update -y
  sudo yum install -y git
}

install_package() {
  echo *** Installing package
  RPM_VERSION=$(echo "$VERSION" | sed 's/-/_/g')
  cd "$TMPDIR/builds/"
  md5sum -c "pki.io-${RPM_VERSION}-1.x86_64.rpm-md5sum"
  sha256sum -c "pki.io-${RPM_VERSION}-1.x86_64.rpm-sha256sum"
  sudo rpm -ivh "pki.io-${RPM_VERSION}-1.x86_64.rpm"
}
