class users::admins {
  users::managed_users { ['joe', 'alice', 'chen']:
    group  => 'co-ops',
  }
  group { 'co-ops':
    ensure  => present,
  }
}
