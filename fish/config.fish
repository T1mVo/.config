# Starship prompt initialization
if command -q starship
    starship init fish | source
end

# pyenv initialization
if command -q pyenv
    pyenv init - | source
end
