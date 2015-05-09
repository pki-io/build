@test "directory" {
  [ -d "/opt/pki.io" ]
}

@test "binary" {
  [ -e "/opt/pki.io/bin/pki.io" ]
}
