## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# PRIMARY FILEBUCKET
# This configures puppet agent and puppet inspect to back up file contents when
# they run. The Puppet Enterprise console needs this to display file contents
# and differences.

# Define filebucket 'main':
filebucket { 'main':
  server => 'puppetfactory.puppetlabs.vm',
  path   => false,
}

# Make filebucket 'main' the default backup location for all File resources:
File { backup => 'main' }

# Randomize enforcement order to help understand relationships
ini_setting { 'random ordering':
  ensure  => present,
  path    => "${settings::confdir}/puppet.conf",
  section => 'agent',
  setting => 'ordering',
  value   => 'title-hash',
}

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
  notify { "Hello, my name is ${::hostname}": }
  
 $message = hiera('message')
  notify { $message: }
  
  if $::virtual != 'physical' {
    $capVMname = capitalize($::virtual)
    notify { "This is a ${capVMname} virtual machine.": }
  }
  
 # file { '/etc/motd':
  #  ensure  => file,
  #  owner   => 'root',
  #  group   => 'root',
  # mode    => '0644',
  #  content => "Making changes to a file! \n",
  # }
#}

 notify { "My fqdn is ${::fqdn}": }

#exec { "cowsay 'Welcome to ${::fqdn}!' > /etc/motd":
#  path    => '/usr/bin:/usr/local/bin',
#  creates => '/etc/motd',
#  }


#host { 'testing.puppetlabs.vm':
# ensure  => present,
# ip      => '127.0.0.1',
# }
 
 #include users
 
 #include skeleton
 
 include memcached
 
 include nginx
 
}
