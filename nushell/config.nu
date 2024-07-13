# Nushell Config File
#
# version = "0.95.0"

let theme = {
    shape_external_resolved: white_bold
    shape_external: red
    shape_externalarg: cyan
    shape_internalcall: white_bold
}

let carapace_completer = {|spans|
    ^carapace $spans.0 nushell ...$spans | from json
}

let fish_completer = {|spans|
    ^fish --command $'complete "--do-complete=($spans | str join " ")"'
    | $"value(char tab)description(char newline)" + $in
    | from tsv --flexible --no-infer
}

$env.config = {
    rm: {
        always_trash: true
    }

    table: {
        mode: compact
    }

    completions: {
        external: {
            completer: $carapace_completer
        }
    }

    color_config: $theme

    highlight_resolved_externals: true

    menus: [
        {
            name: abbr_menu
            only_buffer_difference: false
            marker: none
            type: {
                layout: columnar
                columns: 1
                col_width: 20
                col_padding: 2
            }
            style: {
                text: green
                selected_text: green_reverse
                description_text: yellow
            }
            source: { |buffer, position|
                let match = (scope aliases | where name == $buffer)
                if ($match | is-empty) { {value: $buffer} } else { $match | each { |it| {value: ($it.expansion) }} }
            }
        }
    ]
    
    keybindings: [
        {
            name: abbr_menu_enter
            modifier: none
            keycode: enter
            mode: [emacs, vi_normal, vi_insert]
            event: [
                { send: menu name: abbr_menu }
                { send: enter }
            ]
        }
        {
            name: abbr_menu_space
            modifier: none
            keycode: space
            mode: [emacs, vi_normal, vi_insert]
            event: [
                { send: menu name: abbr_menu }
                { edit: insertchar value: ' '}
            ]
        }
    ]
}

source aliases.nu
