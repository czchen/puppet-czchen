class package::config::apt::debian {
    package { 'apt':
        ensure => installed
    }

    $mirror = 'http.debian.net'

    file { 'sources.list':
        path    => '/etc/apt/sources.list',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        content => template('package/apt/sources.list.debian.erb'),
    }

    file { 'policy':
        path    => '/etc/apt/preferences.d/policy',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        source  => 'puppet:///modules/package/apt/policy.debian',
    }
}

class package::config::apt::ubuntu {
    package { 'apt':
        ensure => installed
    }

    $codename = $lsbdistcodename
    $mirror   = 'archive.ubuntu.com'

    file { 'sources.list':
        path    => '/etc/apt/sources.list',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        content => template('package/apt/sources.list.ubuntu.erb'),
    }
}

class package::config::apt {
    case $operatingsystem {
        Debian: { include package::config::apt::debian }
        Ubuntu: { include package::config::apt::ubuntu }
        default: {}
    }
}
