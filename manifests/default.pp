
node basenode {
  $config = {} #PLACEHOLDER

  import "roles/*.pp"

  include 'stdlib'
  include 'utils'

  class { 'base': 
      config => $config,
      stage  => setup,
  }


  #  anchor { 'basenode::begin': }
  #  anchor { 'basenode::end': }
  #
  #  Anchor['basenode::begin'] 
  #  -> Class['base']
  #  -> Anchor['basenode::end']


}

node default inherits basenode {

}

node "debianbase.pr-z.info" inherits basenode {

  class { "desktop":
    awesome_enabled => true,
    openbox_enabled => true,
    stage           => main,
    user            => "fc",
    features        => ['git']
  }

}

node "ubuntu1.pr-z.info" inherits basenode {

  $local_user = "fc"

  users::account { "$local_user":
    groups   => ['sudo'],
    system   => true,
  }

  class { "desktop":
    awesome_enabled => true,
    openbox_enabled => true,
    stage           => main,
    user            => "fc",
    features        => ['git']
  }

}
