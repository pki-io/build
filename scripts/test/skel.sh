setup_project() { echo "skipping setup_project"; }

setup_env() { echo "skipping setup_env"; }

install_deps() { echo "skipping install_deps"; }

install_bats() { echo "skipping install_bats"; }

install_package() { echo "skipping install_package"; }

clone_tests() { echo "skipping clone_tests"; }

run_tests() { echo "skipping run_tests"; }

cleanup() { echo "skipping cleanup"; }

main() {
  setup_project
  setup_env
  install_deps
  install_bats
  install_package
  clone_tests
  run_tests
  cleanup
}
