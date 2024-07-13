alias md = mkdir
alias mf = touch

alias gst = git status
alias gg = git graph
alias ggo = git graph --oneline

def ll [] {
    ls -l | select mode size modified name | table -i false -t none
}

def la [] {
    ls -la | select mode size modified name | table -i false -t none
}
