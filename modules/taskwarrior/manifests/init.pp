class taskwarrior (
    $t          =   $taskwarrior::params::t,
    $taskopen   =   $taskwarrior::params::taskopen,
    $taskwarrior   =   $taskwarrior::params::taskwarrior,
    $users = [],

) inherits taskwarrior::params {

    package { "taskwarrior":
        ensure =>   'installed',
        name   =>   $taskwarrior::params::packages,
        before =>   Taskwarrior::Rcfile["${users}_taskrc"]
    }

    #taskwarrior::rcfile { "${users}_taskrc":
    #    user     => $users,
    #    filename => ".taskrc"
    #}


    #define taskwarrior::rcfile (
    #  $ensure   = "present",
    #  $user     = undef,
    #  $path     = undef,
    #  $filename = undef,
    #) {

    #    if $user == undef {
    #      fail("\$user need to be specified for taskwarrior::rcfile")
    #    }

    #    if $filename != undef {
    #      $filename_real = $filename
    #    }
    #    else {
    #      $filename_real = $title
    #    }

    #    $home = get_user_home($user)

    #    if $path != undef {
    #      $rcfile_real = "${home}/${filename_real}"
    #    }
    #    else {
    #      $rcfile_real = "${home}/${path}/${filename_real}"
    #    }

    #    notify{"${user} - ${home} - ${filename_real}": }

    #    #file { "${rcfile_real}":
    #      #ensure  => "present",
    #      #owner   => "${user}",
    #      #mode    => "0640",
    #      #content => template("taskwarrior/${taskwarrior::taskwarrior['rc_tmpl']}"),
    #      #}
    #}

}
