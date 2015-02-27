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

        # apparmor
        'apparmor',
        'apparmor-notify',
        'apparmor-utils',

        # debian
        'apt-file',
        'apt-listchanges',
        'apt-transport-https',
        'autopkgtest',
        'debhelper',
        'debian-goodies',
        'devscripts',
        'dh-autoreconf',
        'dh-make',
        'dput-ng',
        'git-buildpackage',
        'how-can-i-help',
        'quilt',
        'ubuntu-dev-tools',

        # development
        'autoconf',
        'automake',
        'blktrace',
        'build-essential',
        'cabal-install',
        'cmake',
        'docker.io',
        'dstat',
        'exuberant-ctags',
        'freemind',
        'ghc',
        'glibc-doc',
        'glibc-doc-reference',
        'libghc-hspec-dev',
        'libtool',
        'libvirt-bin',
        'lxc',
        'manpages',
        'manpages-dev',
        'manpages-posix',
        'manpages-posix-dev',
        'net-tools',
        'pinfo',
        'sysdig',
        'sysstat',
        'texinfo',
        'tig',
        'tiptop',
        'valgrind',
        'virt-manager',

        # desktop
        'keepassx',
        'playonlinux',

        # fonts
        'font-manager',
        'fonts-droid',
        'fonts-noto',

        # gpg key
        'gnupg2',
        'signing-party',

        # miscellaneous
        'autojump',
        'gufw',
        'mutt-patched',
        'p7zip-full',
        'tree',
        'vim-gnome',
        'zsh-antigen',
    ]

    $ubuntu = [
        $debian,
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
