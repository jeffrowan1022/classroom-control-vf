class users::admins {
  $users = ['jose', 'alice', 'chen']
  users::managed_user { $users:
    group  => 'co-ops',
    ensure => present,
  }
  group { 'co-ops':
    ensure  => present,
  }
}
