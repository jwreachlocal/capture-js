exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

package {
  "rbenv":
  ensure => present,
  require => Exec['apt-update'],
}

rbenv::install { $vagrant_user:
  home => $vagrant_home,
  require => [Package['rbenv']],
}

include sqlite
include phantomjs

rbenv::compile { "$vagrant_user/2.2.1":
  user => $vagrant_user,
  home => $vagrant_home,
  ruby => '2.2.1',
  require => Rbenv::Install["$vagrant_user"],
}

host { 'capture-js.dev':
  ip => '127.0.0.1',
}