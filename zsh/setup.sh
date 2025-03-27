#!/bin/sh

ln -s ".config/zsh/.zshenv" "$HOME/.zshenv"

export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/.oh-my-zsh"
export RUNZSH="no"
export KEEP_ZSHRC="yes"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
