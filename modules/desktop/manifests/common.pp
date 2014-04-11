class desktop::common (
    $awesome_enabled,
    $homedirs,
    $openbox_enabled,
    $slim_theme,
    $user = undef

) inherits desktop::params {

    package { $desktop::params::common_packages:
      ensure => 'installed',
    }

    package { $desktop::params::desktop_packages:
      ensure => 'installed',
    }

    # Create Home Dirs
    # TODO Need to create user and groups!
    $homedirs_default = {
      ensure  => 'directory',
      owner   => $user,
      group   => $user,
    }

    $homedirs_real = f_desktop_homedirs_path($homedirs,"/home/${user}")
    create_resources(file,$homedirs_real,$homedirs_default)

    # Slim Resources
    file { "/etc/slim.conf":
      ensure  => $ensure,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('desktop/slim.conf.erb'),
    }

    file { "/usr/share/slim/themes/":
      source  => "puppet:///modules/desktop/slim-themes/",
      recurse => true,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }

    # Desktop Environments
    if $awesome_enabled {
      class { 'desktop::awesome':
        user => $user,
      }
    }
    if $openbox_enabled {
      class { 'desktop::openbox':
        user => $user,
      }
    }



}
