class package::system {
    $debbase = [
        # debian
        'apt-file',
        'debhelper',
        'devscripts',
        'dh-autoreconf',

        # development
        'autoconf',
        'automake',
        'build-essential',
        'cmake',
        'git',
        'libtool',
        'texinfo',
        'valgrind',

        # desktop
        'keepassx',
        'plasma-desktop',
        'playonlinux',
        'yakuake',

        # miscellaneous
        'autojump',
        'gufw',
        'ibus-chewing',
        'manpages',
        'mutt-patched',
        'npm',
        'p7zip-full',
        'puppet',
        'python-pip',
        'ruby',
        'sudo',
        'tmux',
        'tree',
        'vcsh',
        'vim-gnome',
        'zsh',
    ]

    $debian = [
        $debbase,
        'fonts-arphic-uming',
    ]

    $ubuntu = [
        $debbase,
        'manpages-dev',
        'manpages-posix',
        'manpages-posix-dev',
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
