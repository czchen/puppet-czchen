class package::system {
    if $role != travis { include package::config::apt }
    include package::config::sudo

    include package::config::group

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

        # development
        'manpages-posix',
        'manpages-posix-dev',

        # debian
        'apt-file',
        'apt-listchanges',
        'autopkgtest',
        'debhelper',
        'devscripts',
        'dh-autoreconf',
        'dh-make',
        'git-buildpackage',
        'quilt',
        'ubuntu-dev-tools',

        # development
        'autoconf',
        'automake',
        'build-essential',
        'cabal-install',
        'cmake',
        'exuberant-ctags',
        'ghc',
        'libghc-hspec-dev',
        'libtool',
        'pinfo',
        'texinfo',
        'tig',
        'valgrind',
        'virt-manager',

        # desktop
        'keepassx',
        'playonlinux',

        # selinux
        'auditd',
        'selinux-basics',
        'selinux-policy-default',

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
        'zsh-antigen',
    ]

    $ubuntu = [
        $debian,
        'manpages-dev',
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
