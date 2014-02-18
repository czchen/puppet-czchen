class role {
    case $role {
        travis : {
            $user  = 'travis'
            $home  = "/home/${user}/fake_home"
            $shell = '/bin/bash'
        }

        default : {
            $user  = 'czchen'
            $home  = "/home/${user}"
            $shell = '/bin/zsh'
        }
    }

    $group = $user
    $umask = 0022
    $path  = '/usr/local/bin:/usr/bin:/bin'
}
