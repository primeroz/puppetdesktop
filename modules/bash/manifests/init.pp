class bash (
    $bashd_enabled = true,
    $user = undef,

) {

    if $user == undef {
      fail("\$user need to be specified for bash module")
    }

    #TODO Use Templates and Profiles better
    file { "bashrc_user":
      source => "puppet:///modules/bash/bashrc-default",
      path   => "/home/${user}/.bashrc",
      owner   => $user,
      group   => $user,
      mode    => '0640',
      require => Package['bash'],
    }

    #TODO This conflict with one below for "cannot alias file" ...
    #file { "bashd_home_directory":
    #  ensure => "directory",
    #  path   => "/home/${user}/.bash.d/",
    #  owner   => $user,
    #  group   => $user,
    #  mode    => '0750',
    #  require => File['bashrc_user'],
    #}

    file { "bashd_home_snippets":
      source => "puppet:///modules/bash/bash.d/",
      path   => "/home/${user}/.bash.d/",
      recurse => true,
      owner   => $user,
      group   => $user,
      mode    => '0640',
      require => File['bashrc_user'],
    }


}
