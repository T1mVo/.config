ln -s .zshenv "$HOME/.zshenv"

export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
