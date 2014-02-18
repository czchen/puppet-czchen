class config::udev {
    file { '99-android.rules':
        path    => '/etc/udev/rules.d/99-android.rules',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        ensure  => file,
        source  => 'puppet:///modules/config/udev/99-android.rules',
    }
}
