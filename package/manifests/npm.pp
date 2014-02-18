define npm($ensure = installed) {
    case $ensure {
        installed: {
            exec { "npm install -g --prefix ${role::home}/.local ${name}":
                path    => $role::path,
                user    => $role::user,
                group   => $role::group,
                # FIXME: umask does not work here. Why?
                umask   => $role::umask,
                require => Package['npm'],
            }
        }

        default: {
            exec { "npm install -g --prefix ${role::home}/.local ${name}@${ensure}":
                path    => $role::path,
                user    => $role::user,
                group   => $role::group,
                # FIXME: umask does not work here. Why?
                umask   => $role::umask,
                require => Package['npm'],
            }
        }
    }
}

class package::npm {
    package {'npm':
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
