
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

  class { "taskwarrior":
    stage => setup,
    users => ["fc"],
  }

}
