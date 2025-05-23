# Nushell Environment Config File
#
# version = "0.95.0"

def create_left_prompt [] {
    $env.STARSHIP_SHELL = "nu"
    ^starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| "" }

$env.PROMPT_INDICATOR = {|| "" }

$env.EDITOR = "micro"

$env.PATH = ($env.PATH | split row (char esep) | append "/usr/local/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "/opt/homebrew/bin")
$env.PATH = ($env.PATH | split row (char esep) | append "~/.cargo/bin")
