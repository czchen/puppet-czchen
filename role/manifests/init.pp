class role {
    case $factor_role {
        travis : {
            include role::travis
            $user  = $role::travis::user
            $group = $role::travis::group
            $home  = $role::travis::home
            $shell = $role::travis::shell
        }

        default : {
            include role::czchen
            $user  = $role::czchen::user
            $group = $role::czchen::group
            $home  = $role::czchen::home
            $shell = $role::czchen::shell
        }
    }
}
