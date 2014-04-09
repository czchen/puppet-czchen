class package::config::group {
    user { $role::user:
        groups  => [
            'sudo',
            'libvirt',
        ],
        require => [
            Package['sudo'],
            Package['virt-manager'],
        ],
    }
}
