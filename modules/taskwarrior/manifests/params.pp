class taskwarrior::params {

    $taskwarrior = {
      rc_tmpl     => "taskrc.erb",
      url         => "http://spiegl.de/andy/software/t.tar.gz",
      basedir     => "~/.task",
    }

    $t  = {
      url         => "http://spiegl.de/andy/software/t.tar.gz",
      basedir     => "~/task",
    }

    $taskopen  = {
      url         => "https://github.com/ValiValpas/taskopen/archive/master.zip",
      basedir     => "~/tasknotes",
      rc_tmpl     => "taskopenrc.erb",
    }

    case $::osfamily {
      'Debian': {
        $packages = ['task'] 
      }
    }

}
