Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# Node
class { 'nodejs':
  version => 'v0.12.7',
  with_npm => false,
}

# Install node modules to server
class node_modules {
  $node_packages = [  'npm', 'bower', 'gulp', 'pm2'  ]

  package { $node_packages:
    provider => 'npm',
    require  => Class['nodejs']
  }
}

class {'::mongodb::client':}
class {'::mongodb::server':
  verbose => true
}

class system-update {
  $sysPackages = [ "git" ]
  package { $sysPackages:
    ensure => "installed"
  }
}

# Include modules
include stdlib
include wget
include nodejs
include node_modules

include ::mongodb::server
include system-update
