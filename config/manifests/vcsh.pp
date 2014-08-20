define resource_vcsh($url) {
    exec { "vcsh ${name}":
        path        => '/bin:/usr/bin',
        user        => $role::user,
        command     => "vcsh clone ${url} ${name}",
        environment => [
            "HOME=${role::home}",
        ],
        onlyif      => "vcsh status ${name} 2>&1|grep 'no repository found for'",
        require     => Package['vcsh'],
    }
}

class config::vcsh {
    $vcsh = {
        'bzr'            => { url => 'https://github.com/czchen/bzr.vcsh', },
        'debian'         => { url => 'https://github.com/czchen/debian.vcsh', },
        'font'           => { url => 'https://github.com/czchen/font.vcsh', },
        'gdb'            => { url => 'https://github.com/czchen/gdb.vcsh', },
        'gem'            => { url => 'https://github.com/czchen/gem.vcsh', },
        'git'            => { url => 'https://github.com/czchen/git.vcsh', },
        'golang'         => { url => 'https://github.com/czchen/golang.vcsh', },
        'gpg'            => { url => 'https://github.com/czchen/gpg.vcsh', },
        'hg'             => { url => 'https://github.com/czchen/hg.vcsh', },
        'mutt'           => { url => 'https://github.com/czchen/mutt.vcsh', },
        'npm'            => { url => 'https://github.com/czchen/npm.vcsh', },
        'python'         => { url => 'https://github.com/czchen/python.vcsh', },
        'rime'           => { url => 'https://github.com/czchen/rime.vcsh', },
        'rpm'            => { url => 'https://github.com/czchen/rpm.vcsh', } ,
        'ssh'            => { url => 'https://github.com/czchen/ssh.vcsh', } ,
        'sublime-text-3' => { url => 'https://github.com/czchen/sublime-text-3.vcsh', },
        'tmux'           => { url => 'https://github.com/czchen/tmux.vcsh', },
        'vim'            => { url => 'https://github.com/czchen/vim.vcsh', },
        'zsh'            => { url => 'https://github.com/czchen/zsh.vcsh', },
    }

    package { 'vcsh':
        ensure => installed,
    }

    create_resources(resource_vcsh, $vcsh)
}
