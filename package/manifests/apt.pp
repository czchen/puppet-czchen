class package::apt::debian {
    package { 'apt':
        ensure => installed
    }

    file { 'sources.list':
        path    => '/etc/apt/sources.list',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        source  => 'puppet:///modules/package/apt/debian/sources.list',
    }

    file { 'policy':
        path    => '/etc/apt/preferences.d/policy',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        source  => 'puppet:///modules/package/apt/debian/sources.list',
    }
}

class package::apt {
    case $operatingsystem {
        Debian: { include package::apt::debian }
        default: {}
    }
}
