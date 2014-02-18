class package::system {
    if $role != travis { include package::config::apt }
    include package::config::sudo

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
        'apt-listchanges',
        'debhelper',
        'devscripts',
        'dh-autoreconf',
        'dh-make',
        'git-buildpackage',
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

        # desktop
        'keepassx',
        'plasma-desktop',
        'playonlinux',

        # miscellaneous
        'autojump',
        'fonts-arphic-uming',
        'gufw',
        'manpages',
        'mutt-patched',
        'p7zip-full',
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

        # development
        'gcc',
        'kernel-devel',
        'kernel-headers',
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
