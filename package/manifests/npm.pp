define npm($ensure = installed) {
    case $ensure {
        installed: {
            exec { "npm install -g --prefix ${role::home}/.local ${name}":
                path        => $role::path,
                user        => $role::user,
                group       => $role::group,
                umask       => $role::umask,
                environment => [
                    "HOME=${role::home}",
                ],
                unless      => "npm list -g ${name}|grep ${name}@",
                require     => Package[$package::npm::npm],
            }
        }

        default: {
            $version = $ensure
            exec { "npm install -g --prefix ${role::home}/.local ${name}@${version}":
                path        => $role::path,
                user        => $role::user,
                group       => $role::group,
                umask       => $role::umask,
                environment => [
                    "HOME=${role::home}",
                ],
                unless      => "npm list -g ${name}|grep ${name}@${version}",
                require     => Package[$package::npm::npm],
            }
        }
    }
}

class package::npm {
    $npm = 'npm'
    package {$npm:
        ensure => installed
    }

    $package = [
        'n',
        'LiveScript',
        'ydict.js',
    ]

    npm { $package:
        ensure => installed
    }
}
