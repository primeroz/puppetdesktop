class conky (
    $user = undef,
) {

    if $user == undef {
      fail("\$user need to be specified for conky module")
    }

    package { ["conky"]:
      ensure => installed
    }

    file { "/home/${user}/.config/conky/":
      ensure => "directory",
      owner   => $user,
      group   => $user,
      mode    => '0750',
      require => PAckage['conky'],
    }

    #TODO This should be somewhere else
    conky::config { "desktop/conkydate":
     user     => $user,
     path     => "desktop",
     filename => "conkydate",
     filetype => "source",
     source   => "conky/desktop/conkydate"
    }
    conky::config { "desktop/conkymin":
     user     => $user,
     path     => "desktop",
     filename => "conkymin",
     filetype => "source",
     source   => "conky/desktop/conkymin"
    }
    conky::config { "desktop/conkyhr":
     user     => $user,
     path     => "desktop",
     filename => "conkyhr",
     filetype => "source",
     source   => "conky/desktop/conkyhr"
    }
    conky::config { "desktop/conkystats":
     user     => $user,
     path     => "desktop",
     filename => "conkystats",
     filetype => "source",
     source   => "conky/desktop/conkystats"
    }

}
