class desktop (
    $awesome_enabled = false,
    $openbox_enabled = false,
    $taskwarrior_enabled = true,
    $user = undef,
    $features = ['git'],

) inherits desktop::params {

    if $user == undef {
      fail("\$user need to be specified for desktop")
    }

    if 'git' in $features {
      class { 'git':
          svn => false,
          gui => false,
      }
    }

    class { 'desktop::common': 
      awesome_enabled => $awesome_enabled,
      openbox_enabled => $openbox_enabled,
      user            => $user,
    }

    if $taskwarrior_enabled {
      class { 'taskwarrior':
        user => $user,
      }
    }

    class { "bash": 
      user => "fc",
    }

    class { 'conky':
      user => "fc",
    }

}
