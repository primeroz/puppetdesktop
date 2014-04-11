class desktop::params {

    case $::osfamily {
      'Debian': {
        $common_packages = [ 'python-xdg',
                             'slim',
                             'unagi',
                             'wicd',
                             'wicd-cli',
                             'wicd-curses',
                             'wicd-gtk',
                             'xdg-user-dirs',
                             'xdg-utils',
                             'xorg',
                           ] 

        $awesome_packages = [ 'awesome',
                              'awesome-extra',
                            ]

        $openbox_packages = [ 'obconf',
                              'obmenu',
                              'openbox',
                              'openbox-themes',
                            ]

        $desktop_packages = [ 'thunar',
                              'thunar-archive-plugin',
                              'thunar-data',
                              #'thunar-dropbox-plugin',
                              'thunar-gtkhash',
                              'thunar-media-tags-plugin',
                              'thunar-volman',
                            ]

      }

    }

}
