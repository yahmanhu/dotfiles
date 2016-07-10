# Path to oh-my-zsh
export ZSH=~/.oh-my-zsh

# zsh theme
ZSH_THEME="yahmanhu"

# Plugins
plugins=(git zsh-syntax-highlighting)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/rio/scripts:/home/rio/.gem/ruby/2.3.0/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
export BROWSER='firefox'

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
source ~/.zsh_functions
source ~/.pacman_functions
source ~/.zsh_completions
export LANG=en_US.UTF-8

# fzf
export FZF_DEFAULT_COMMAND='find .'
export FZF_DEFAULT_OPTS="--exact --extended --reverse --color=bg+:-1,fg+:-1,hl+:6,hl:9,info:11,pointer:6,prompt:10,header:3 --bind=tab:down,btab:up,ctrl-j:page-down,ctrl-k:page-up"

# Load dircolors
eval $(dircolors ~/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ":completion:*:descriptions" format "%B%d%b"

# Custom key-bindings
bindkey ^k up-line-or-search
bindkey ^j down-line-or-search

bindkey -M menuselect '^o' accept-and-infer-next-history
bindkey -M menuselect '^s' accept-and-menu-complete

# vi key-bindings
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line
