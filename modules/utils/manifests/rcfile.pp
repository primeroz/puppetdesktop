define utils::rcfile (
  $ensure   = "present",
  $user     = undef,
  $home     = "/home",
  $path     = undef,
  $filename = undef,
  $template = undef,
) {

    if $user == undef {
      fail("\$user need to be specified for utils::rcfile")
    }

    if $filename == undef {
      fail("\$filename need to be specified for utils::rcfile")
    }

    if $template == undef {
      fail("\$template need to be specified for utils::rcfile")
    }

    $home_real = "${home}/${user}"

    if $path != undef {
      $rcfile_real = "${home_real}/${filename}"
    }
    else {
      $rcfile_real = "${home_real}/${path}/${filename}"
    }

    file { "${rcfile_real}":
      ensure  => "${ensure}",
      owner   => "${user}",
      mode    => "0640",
      content => template("${template}"),
    }
}

