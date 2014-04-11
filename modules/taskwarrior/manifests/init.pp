class taskwarrior (
    $t          =   $taskwarrior::params::t,
    $taskopen   =   $taskwarrior::params::taskopen,
    $taskwarrior   =   $taskwarrior::params::taskwarrior,
    $user = undef,

) inherits taskwarrior::params {

    package { "taskwarrior":
        ensure =>   'installed',
        name   =>   $taskwarrior::params::packages,
    }

    if $user == undef {
      fail("\$user need to be specified for taskwarrior")
    }

    utils::rcfile { "taskrc":
        user     => $user,
        home     => "/home",
        path     => undef,
        template => "taskwarrior/${taskwarrior['rc_tmpl']}",
        filename => ".taskrc"
    }

}
