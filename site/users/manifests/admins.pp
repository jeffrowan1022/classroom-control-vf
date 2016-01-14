class users::admins {
  group { 'staff':
    ensure  => present,
  }
  users::managed_user { 'jose': 
      group  => 'staff',
  }
  users::managed_user { 'alice':
      group  => 'staff',
  }
 
}
