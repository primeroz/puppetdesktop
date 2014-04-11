class desktop::awesome (
  $themes_enabled,
  $user = undef
) inherits desktop::params {

    package { $desktop::params::awesome_packages:
      ensure => 'installed',
    }

    # Awesome Themes
    if $themes_enabled {
      git::repo { "awesome_themes":
        source => "https://github.com/mikar/awesome-themes.git",
        path   => "/home/${user}/.config/awesome/themes/"
      }
    }

    # Awesome Configuration
    # TODO need to template rc.lua
    file { "awesome_config":
      source => "puppet:///modules/desktop/awesome/",
      path   => "/home/${user}/.config/awesome/",
      recurse => true,
      owner   => $user,
      group   => $user,
      mode    => '0770',
      require => Package['awesome'],
    }

}
