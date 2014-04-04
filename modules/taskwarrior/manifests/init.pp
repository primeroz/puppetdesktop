class taskwarrior (
    $t          =   $taskwarrior::params::t,
    $taskopen   =   $taskwarrior::params::taskopen,
    $taskwarrior   =   $taskwarrior::params::taskwarrior,
    $users = [],

) inherits taskwarrior::params {

    package { "taskwarrior":
        ensure =>   'installed',
        name   =>   $taskwarrior::params::packages,
    }

    #TODO: ElsIf user is just a string 
    if $users == [] {
      fail("\$users need to be specified for taskwarrior")
    }
    else {
      # task_rc goes into ~/.taskrc
      $task_rc = taskwarrior_files($users,undef,".taskrc")
    }

    # Create the resources
    create_resources(taskwarrior::rcfile,$task_rc)

    #TODO: Manage Present/Absent ensure
    define taskwarrior::rcfile (
      $ensure   = "present",
      $user     = undef,
      $path     = undef,
      $filename = undef,
    ) {

        if $user == undef {
          fail("\$user need to be specified for taskwarrior::rcfile")
        }

        if $filename == undef {
          fail("\$filename need to be specified for taskwarrior::rcfile")
        }

        #TODO: Only WORKS with puppet apply since function run on clinet ... bad bad bad
        $home = get_user_home($user)

        if $path != undef {
          $rcfile_real = "${home}/${filename}"
        }
        else {
          $rcfile_real = "${home}/${path}/${filename}"
        }

        file { "${rcfile_real}":
          ensure  => "present",
          owner   => "${user}",
          mode    => "0640",
          content => template("taskwarrior/${taskwarrior::taskwarrior['rc_tmpl']}"),
        }
    }

}
