setup_project() { echo "skipping setup_project"; }

install_deps() { echo "skipping install_deps"; }

install_bats() { echo "skipping install_bats"; }

install_fdm() { echo "skipping install_fdm"; }

install_go() { echo "skipping install go"; }

clone_source() { echo "skipping clone_source"; }

build_source() { echo "skipping build_source"; }

build_packages() { echo "skipping build_packages"; }

publish_packages() { echo "skipping publish_packages"; }

cleanup() { echo "skipping cleanup"; }

main() {
  setup_project
  install_deps
  install_bats
  install_fdm
  install_go
  clone_source
  build_source
  build_packages
  publish_packages
  cleanup
}
