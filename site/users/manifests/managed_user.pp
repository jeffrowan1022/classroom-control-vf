define users::managed_user (
  $grpoup = $title,
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