define pip($ensure = installed) {
    case $ensure {
        installed: {
            exec { "pip install --user --force-reinstall ${name}":
                path        => $role::path,
                user        => $role::user,
                group       => $role::group,
                umask       => $role::umask,
                environment => [
                    "HOME=${role::home}",
                ],
                unless      => "pip list --local|grep ^${name}",
                require     => Package[$package::pip::pip],
            }
        }
    }
}

class package::pip {
    # FIXME: other distro package name?
    $pip = 'python-pip'
    package { $pip:
        ensure => installed
    }

    $package = [
        'pip',
        'virtualenvwrapper',
    ]

    pip { $package:
        ensure => installed
    }
}
