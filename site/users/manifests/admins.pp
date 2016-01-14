class users::admins {
  group { 'staff':
    ensure  => present,
  }
  $users = 'jose',
  users::managed_user { $users:
    group  => 'staff',
  }
 
}
