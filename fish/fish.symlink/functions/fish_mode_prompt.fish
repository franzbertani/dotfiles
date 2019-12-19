function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold --background blue white
            echo ' N '
        case insert
            set_color --bold --background green white
            echo ''
        case replace_one
            set_color --bold --background red white
            echo ' R '
        case visual
            set_color --bold --background magenta white
            echo ' V '
        end
        set_color normal
end

