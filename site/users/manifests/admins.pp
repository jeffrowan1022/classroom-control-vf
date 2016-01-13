class users::admins {
  $users = ['jose', 'alice', 'chen']
  users::managed_user { $users:
    group  => 'co-ops',
  }
  group { 'co-ops':
    ensure  => present,
  }
}
