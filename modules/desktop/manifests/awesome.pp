class desktop::awesome (
    $user = undef

) inherits desktop::params {

    package { $desktop::params::awesome_packages:
      ensure => 'installed',
    }

}
