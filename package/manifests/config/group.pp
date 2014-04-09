class package::config::group {
    user { $role::user:
        groups  => [
            'sudo',
        ],
        require => [
            Package['sudo'],
        ],
    }
}
