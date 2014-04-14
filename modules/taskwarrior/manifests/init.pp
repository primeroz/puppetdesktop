class taskwarrior (
    $t          =   $taskwarrior::params::t,
    $taskopen   =   $taskwarrior::params::taskopen,
    $taskwarrior   =   $taskwarrior::params::taskwarrior,
    $user = undef,

) inherits taskwarrior::params {

    package { "${taskwarrior::params::packages}":
        ensure =>   'installed',
    }

    if $user == undef {
      fail("\$user need to be specified for taskwarrior")
    }

    # .taskrc configuration file
    utils::rcfile { "taskrc":
        user     => $user,
        home     => "/home",
        path     => undef,
        template => "taskwarrior/${taskwarrior['rc_tmpl']}",
        filename => ".taskrc"
    }

    file { "/usr/local/bin/taskopen":
        ensure  => "present",
        owner   => "root",
        group   => "root",
        mode    => "0755",
        source  => "puppet:///modules/taskwarrior/bin/taskopen",
        require => Package["taskwarrior"],
        before  => Utils::Rcfile["taskopenrc"],
    }

    # .taskopenrc configuration file
    utils::rcfile { "taskopenrc":
        user     => $user,
        home     => "/home",
        path     => undef,
        template => "taskwarrior/${taskopen['rc_tmpl']}",
        filename => ".taskopenrc"
    }
    file { "/usr/local/bin/t":
        ensure  => "present",
        owner   => "root",
        group   => "root",
        mode    => "0755",
        content => template("taskwarrior/bin/t"),
        require => Package["taskwarrior"],
    }
    file { "/usr/local/bin/tt":
        ensure  => "link",
        target  => "/usr/local/bin/t",
        require => File["/usr/local/bin/t"],
    }

}
