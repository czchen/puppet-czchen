class role::travis {
    $user  = 'travis'
    $group = 'travis'
    $home  = "/home/${user}/fake_home"
    $shell = '/bin/bash'
}
