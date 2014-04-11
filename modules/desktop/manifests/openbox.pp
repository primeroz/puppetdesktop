class desktop::openbox (
    $user = undef

) inherits desktop::params {

    package { $desktop::params::openbox_packages:
      ensure => 'installed',
    }

}
