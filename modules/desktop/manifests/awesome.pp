class desktop::awesome (
    $user = undef

) inherits desktop::params {

    package { $desktop::params::awesome_packages:
      ensure => 'installed',
    }

    file { 'awesome_config':
      ensure  => "directory",
      path    => "/home/${user}/.config/awesome",
      require => File["/home/${user}/.config"],
      owner   => $user,
      group   => $group,
      mode    => "0700",
    }

}
