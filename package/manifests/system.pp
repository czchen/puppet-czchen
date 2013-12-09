class package::system {
    $debian = [
        'autojump',
        'build-essential',
        'cmake',
        'debhelper',
        'devscripts',
        'git',
        'gufw',
        'ibus-chewing',
        'manpages',
        'npm',
        'p7zip-full',
        'puppet',
        'python-pip',
        'ruby',
        'sudo',
        'tree',
        'vcsh',
        'vim-gnome',
        'zsh',
    ]

    $ubuntu = [
        $debian,
        'manpages-dev',
        'manpages-posix',
        'manpages-posix-dev',
        'mutt-patched',
    ]

    $package = $operatingsystem ? {
        Debian  => $debian,
        Ubuntu  => $ubuntu,
        default => [],
    }

    package { $package:
        ensure => installed,
    }
}