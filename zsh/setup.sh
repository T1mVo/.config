#!/bin/sh

set -eu

REAL="$(realpath "$0")"
LOCAL="$(dirname "$REAL")"

ln --force --symbolic "$LOCAL/.zshenv" "$HOME/.zshenv"

export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh"
export CHSH="no"
export RUNZSH="no"
export KEEP_ZSHRC="yes"

rm -rf "$ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

PLUGIN="$ZSH/custom/plugins"

git clone "https://github.com/hlissner/zsh-autopair.git" "$PLUGIN/zsh-autopair"
git clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$PLUGIN/zsh-autosuggestions"
git clone "https://github.com/MenkeTechnologies/zsh-expand.git" "$PLUGIN/zsh-expand"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$PLUGIN/zsh-syntax-highlighting"

