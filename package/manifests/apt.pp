class package::apt::debian {
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
        content => template('package/apt/debian/sources.list.erb'),
    }

    file { 'policy':
        path    => '/etc/apt/preferences.d/policy',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        require => Package['apt'],
        source  => 'puppet:///modules/package/apt/debian/policy',
    }
}

class package::apt::ubuntu {
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
        content => template('package/apt/ubuntu/sources.list.erb'),
    }
}

class package::apt {
    case $operatingsystem {
        Debian: { include package::apt::debian }
        Ubuntu: { include package::apt::ubuntu }
        default: {}
    }
}
