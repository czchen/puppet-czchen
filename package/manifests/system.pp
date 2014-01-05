class package::system {
    $debian = [
        # debian
        'apt-file',
        'debhelper',
        'devscripts',

        # development
        'autoconf',
        'automake',
        'build-essential',
        'cmake',
        'git',
        'libtool',
        'texinfo',
        'valgrind',

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

    $ubuntu = [
        $debian,
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
