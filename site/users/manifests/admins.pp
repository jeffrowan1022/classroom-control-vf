class users::admins {
  $users = ['jose', 'alice', 'chen']
  users::managed_users { $users:
    group  => 'co-ops',
  }
  group { 'co-ops':
    ensure  => present,
  }
}
