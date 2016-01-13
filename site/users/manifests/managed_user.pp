define users::managed_user {
 user { $title:
   ensure => present,
  }
 file { ["/home/${title}", "/home/.ssh"]:
   ensure => directory,
   owner  => $title,
   group  => $title,
  }
}
