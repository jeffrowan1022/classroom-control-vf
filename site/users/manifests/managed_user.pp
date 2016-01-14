define users::managed_user (
  $group = $title,
) {  
 user { $title:
   ensure => present,
  }
 file { ["/home/${title}", "/home/.ssh"]:
   ensure => directory,
   owner  => $title,
   group  => $group,
  }
}
