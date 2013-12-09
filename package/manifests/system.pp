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

    case $operatingsystem {
        Debian: { $package = $debian }
        Ubuntu: { $package = $ubuntu }
    }

    package { $package:
        ensure => installed,
    }
}
