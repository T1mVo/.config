# Path to oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"

plugins=(
	aliases
	git
)

if [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then
	plugins+=(
		zsh-autopair
		zsh-autosuggestions
		zsh-expand
		zsh-syntax-highlighting
	)

	export ZPWR_EXPAND_BLACKLIST=(ls grep)
	export ZPWR_EXPAND_SECOND_POSITION=true
fi

source $ZSH/oh-my-zsh.sh

ZSH_THEME_TERM_TITLE_IDLE="%~"
ZSH_THEME_TERM_TAB_TITLE_IDLE="%~"

alias mf="touch"
alias ggr="git log --graph"
alias ggro="git log --graph --oneline"

alias -g L="| less"
alias -g G="| grep"

eval "$(starship init zsh)"
