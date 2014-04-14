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

    if $path == undef {
      $configfile_real = "${home_real}/.config/conky/${filename}"
    }
    else {
      # Try create the directory via file resource if resource not yet defined!
      if ! defined(File["${home_real}/.config/conky/${path}"]) {
        file { "${home_real}/.config/conky/${path}":
          ensure  => "directory",
          owner   => "${user}",
          group   => "${user}",
          mode    => "0750",
        }
      }
      $configfile_real = "${home_real}/.config/conky/${path}/${filename}"
    }

    file { "${configfile_real}":
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

