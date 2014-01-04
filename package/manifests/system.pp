class package::system {
    $debian = [
        'apt-file',
        'autoconf',
        'autojump',
        'automake',
        'build-essential',
        'cmake',
        'debhelper',
        'devscripts',
        'git',
        'gufw',
        'ibus-chewing',
        'libtool',
        'manpages',
        'mutt-patched',
        'npm',
        'p7zip-full',
        'puppet',
        'python-pip',
        'ruby',
        'sudo',
        'texinfo',
        'tmux',
        'tree',
        'valgrind',
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
