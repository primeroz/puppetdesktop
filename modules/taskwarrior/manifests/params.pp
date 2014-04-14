class taskwarrior::params {

    $taskwarrior = {
      rc_tmpl     => "taskrc.erb",
      url         => "http://spiegl.de/andy/software/t.tar.gz",
      basedir     => "~/.task",
      theme       => $::osfamily ? {
        'Debian' => "/usr/share/task/dark-gray-256",
        default  => "/usr/share/task/dark-gray-256"
      }
    }

    $t  = {
      url         => "http://spiegl.de/andy/software/t.tar.gz",
      basedir     => "/task", #Relative to USER HOME
    }

    $taskopen  = {
      url         => "https://github.com/ValiValpas/taskopen/archive/master.zip",
      basedir     => "tasknotes", #Relative to USER HOME
      rc_tmpl     => "taskopenrc.erb",
    }

    case $::osfamily {
      'Debian': {
        $packages = ['task','libjson-perl']
        $taskwarrior_theme = "/usr/share/task/dark-gray-256.theme"
      }
    }

}
