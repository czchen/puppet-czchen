define sudo_config() {
    file { $name:
        path    => "/etc/sudoers.d/${name}",
        owner   => 'root',
        group   => 'root',
        mode    => '0400',
        ensure  => file,
        require => Package['sudo'],
        source  => "puppet:///modules/package/sudo/${name}",
    }
}

class package::sudo {
    package { 'sudo':
        ensure => installed,
    }

    $config = [
        'home',
        'umask',
    ]

    sudo_config { $config: }
}
