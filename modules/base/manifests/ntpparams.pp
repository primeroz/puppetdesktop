# TODO: Add keys management
# TODO: Add other OS Families and Linux Versions

class base::ntpparams {

    $config_template    =   'base/ntp.conf.erb'
    $pool_servers       =   []
    $service_enabled    =   true
    $service_ensure     =   'running'
    $service_manage     =   true

    # On virtual machines allow large clock skews.
    $panic = str2bool($::is_virtual) ? {
        true    => false,
        default => true,
    }

    # Define Vars based on OSFAMILY

    case $::osfamily {
        'Redhat': {
            $config_file    = '/etc/ntp.conf'
            $drift_file     = '/var/lib/ntp/drift'
            $keys_file      = '/etc/ntp/keys'
            $package_name   = ['ntp']
            $service_name   = 'ntpd'
            $ntp_servers    = [ 
                '0.centos.pool.ntp.org',
                '1.centos.pool.ntp.org',
                '2.centos.pool.ntp.org',
            ]
            }
     'Debian': {
            $config_file          = '/etc/ntp.conf'
            $keys_file       = '/etc/ntp/keys'
            $drift_file       = '/var/lib/ntp/drift'
            $package_name    = [ 'ntp' ]
            $service_name    = 'ntp'
            $ntp_servers         = [
                '0.debian.pool.ntp.org iburst',
                '1.debian.pool.ntp.org iburst',
                '2.debian.pool.ntp.org iburst',
                '3.debian.pool.ntp.org iburst',
            ]
      }
        default: { fail("The ${module_name} module is not supported on an ${::osfamily} based system.") }
    }
}
