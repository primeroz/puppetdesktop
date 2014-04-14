define conky::config (
  $ensure   = "present",
  $user     = undef,
  $mode     = "640",
  $home     = "/home",
  $path     = undef,
  $filename = undef,
  $filetype = "template",
  $template = undef,
  $source   = undef,
) {

    if $user == undef {
      fail("\$user need to be specified for conky::config")
    }

    if $filename == undef {
      fail("\$filename need to be specified for conky::config")
    }

    $home_real = "${home}/${user}"

    if $path != undef {
      $configfile_real = "${home_real}/.config/conky/${filename}"
    }
    else {
      $configfile_real = "${home_real}/.config/conky/${path}/${filename}"
    }

    file { "${rcfile_real}":
      ensure  => "${ensure}",
      owner   => "${user}",
      group   => "${user}",
      mode    => "${mode}",
      source  => $filetype ? {
        "template" => undef,
        "source"   => "puppet:///modules/${source}",
        default    => undef,
      },
      content  => $filetype ? {
        "template" => template("${template}"),
        "source"   => undef,
        default    => undef,
      },
    }
}

