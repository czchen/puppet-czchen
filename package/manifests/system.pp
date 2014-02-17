class package::system {
    include package::sudo

    $default = [
        # development
        'git',

        # miscellaneous
        'ibus-chewing',
        'puppet',
        'tmux',
        'zsh',
    ]

    $debian = [
        $default,

        # debian
        'apt-file',
        'debhelper',
        'devscripts',
        'dh-autoreconf',
        'dh-make',
        'quilt',

        # development
        'autoconf',
        'automake',
        'build-essential',
        'cmake',
        'libtool',
        'pinfo',
        'texinfo',
        'tig',
        'valgrind',

        # miscellaneous
        'autojump',
        'gufw',
        'manpages',
        'mutt-patched',
        'npm',
        'p7zip-full',
        'python-pip',
        'ruby',
        'tree',
        'vim-gnome',
    ]

    $ubuntu = [
        $debian,
        'manpages-dev',
        'manpages-posix',
        'manpages-posix-dev',
    ]

    $fedora = [
        $default,
    ]

    $package = $operatingsystem ? {
        Debian  => $debian,
        Ubuntu  => $ubuntu,
        Fedora  => $fedora,
        default => $default,
    }

    package { $package:
        ensure => installed,
    }
}
