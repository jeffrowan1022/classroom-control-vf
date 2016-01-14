class users::admins {
  group { 'co-ops':
    ensure  => present,
  }
  $users = ['jose', 'alice', 'chen']
  users::managed_user { $users:
    group  => 'co-ops',
  }
 
}
