define gem($ensure = installed) {
    case $ensure {
        installed: {
            exec { "gem install --user-install ${name}":
                path        => $role::path,
                user        => $role::user,
                group       => $role::group,
                umask       => $role::umask,
                environment => [
                    "HOME=${role::home}",
                ],
                unless      => "gem list --local|grep  '${name} ('",
                require     => Package[$package::gem::gem],
            }
        }

        default: {
            $version = $ensure
            exec { "gem install --user-install ${name} --version ${version}":
                path        => $role::path,
                user        => $role::user,
                group       => $role::group,
                umask       => $role::umask,
                environment => [
                    "HOME=${role::home}",
                ],
                unless      => "gem list --local|grep  '${name} (${version})'",
                require     => Package[$package::gem::gem],
            }
        }
    }
}

class package::gem {
    if $role == travis {
        $gem = 'rubygems'
    } else {
        $gem = 'ruby'
    }

    package {$gem:
        ensure => installed
    }

    $package = [
        'puppet',
        'puppet-lint',
        'tmuxinator',
    ]

    gem {$package:
        ensure => installed
    }
}
