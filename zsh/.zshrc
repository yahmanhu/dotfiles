# Path to your oh-my-zsh installation.
export ZSH=/home/rio/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="yahmanhu"

#echo -e "\033[?17;0;127c"
#echo -e "\e[?16;0;200c"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 #ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-syntax-highlighting)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/rio/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'
export BROWSER='firefox'

source $ZSH/oh-my-zsh.sh
source ~/.zsh_aliases
source ~/.zsh_functions
source ~/.pacman_functions
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 #if [[ -n $SSH_CONNECTION ]]; then
   #export EDITOR='vim'
 #else
   #export EDITOR='mvim'
 #fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# Load dircolors
eval $(dircolors ~/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ":completion:*:descriptions" format "%B%d%b"

# pacman: removed orphaned
#pacrmo() {
    #echo -e "sudo pacman -Rns \$(pacman -Qdtq). Remove all orphaned packages, their configuration files and unneeded dependecies.\n"
    #sudo pacman -Rns $(pacman -Qdtq)
#}

## pacman: remove packages
#pacrm() {
    #echo -e "sudo pacman -Rns. Remove packages, their configuration files and unneeded dependecies.\n"
    #sudo pacman -Rns $@
#}

## pacman set up mirror list
#pacmirror() {
    #echo -e "Use the new pacman mirrorlist as the default mirrorlist and create a backup of the current mirrorlist? (y = yes)"
    #read answer_list
    #if [[ $answer_list == "y" ]] || [[ $answer_list == "Y" ]]; then
        #sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
        #sudo mv /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist
        #echo "New mirrorlist: done!"
        #echo "Opening the new mirrorlist for editing."
        #sudo vim /etc/pacman.d/mirrorlist
    #else
        #echo "pacmirror script stopped. Nothing changed."
    #fi
#}

## pacman: list or search in cache
#pacpkg() {
    #cache_dir=/var/cache/pacman/pkg
    #if [[ $1 == "" ]]; then
    #echo -e "Listing $cache_dir:"
        #ls -l $cache_dir
    #else
    #echo -e "Search results for $1 in $cache_dir:"
        #ls -l $cache_dir | grep $1
    #fi
#}

#pacdep() {

    #pacman -Qi $@ | grep "Depends"

#}
