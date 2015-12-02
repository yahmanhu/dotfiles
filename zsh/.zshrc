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

source $ZSH/oh-my-zsh.sh

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

#=================
# Custom functions
#=================

# Trash list
tl() {
    echo -e "Trash:"
    ls -lh ~/.local/share/Trash/files/
}

# trashman: put
tp() {
    trash $@
    echo -e "Deleted:"
    printf '%s\n' "$@"
}

# trashman: empty
te() {

    if [[ "$(ls ~/.local/share/Trash/files/)" == "total 0" ]]; then
        echo "Trash is empty."
    else
        echo -e "Are you sure you want to remove these files? (y = yes)"
        trash --list
        read answer_trash
        if [[ $answer_trash == "y" ]] || [[ $answer_trash == "Y" ]]; then
            trash --empty
            echo -e "Trash is empty."
        else
            echo -e "Trash hasn't been emptied."
        fi
    fi
}

# pacman: removed orphaned
pacrmo() {
    echo -e "sudo pacman -Rns \$(pacman -Qdtq). Remove all orphaned packages, their configuration files and unneeded dependecies.\n"
    sudo pacman -Rns $(pacman -Qdtq)
}

# pacman: remove packages
pacrm() {
    echo -e "sudo pacman -Rns. Remove packages, their configuration files and unneeded dependecies.\n"
    sudo pacman -Rns $@
}

# pacman set up mirror list
pacmirror() {
    echo -e "Use the new pacman mirrorlist as the default mirrorlist and create a backup of the current mirrorlist? (y = yes)"
    read answer_list
    if [[ $answer_list == "y" ]] || [[ $answer_list == "Y" ]]; then
        sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
        sudo mv /etc/pacman.d/mirrorlist.pacnew /etc/pacman.d/mirrorlist
        echo "New mirrorlist: done!"
        echo "Opening the new mirrorlist for editing."
        sudo vim /etc/pacman.d/mirrorlist
    else
        echo "pacmirror script stopped. Nothing changed."
    fi
}

# pacman: list or search in cache
pacpkg() {
    cache_dir=/var/cache/pacman/pkg
    if [[ $1 == "" ]]; then
    echo -e "Listing $cache_dir:"
        ls -l $cache_dir
    else
    echo -e "Search results for $1 in $cache_dir:"
        ls -l $cache_dir | grep $1
    fi
}

pacdep() {

    pacman -Qi $@ | grep "Depends"

}

# List custom aliases
lsalias() {
    cat ~/.zshrc | grep '^alias'
}

# Downaload bbtv
bbtv() {
 youtube-dl -o "~/downloads/%(title)s.%(ext)s" http://www.bbtv.hu/bbtv-$1
}

# Colored man pages (https://wiki.archlinux.org/index.php/Man_page#Using_less_.28Recommended.29)
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

lsgrep() {

    ls -lh --color=auto | grep $1

} 

lsdir() {

    ls -lh --color=auto $HOME/$1

}

volume-switcher() {

vol_state=$(amixer get Master | egrep Playback | egrep -o off)

    if [[ $vol_state == "off" ]]; then
        amixer sset Master unmute > /dev/null
    else
        amixer sset Master mute > /dev/null
    fi

}

find-file(){

    find ~ -type f -iname $1\* -exec ls --color -d {} \;

}

find-dir(){

    find ~ -type d -iname $1\* -exec ls --color -d {} \;

}

find-by-file-type(){

    find ~ -iname "*.$1" -exec ls --color -d {} \;

}

find-by-name(){

    find ~ -iname $1\* -exec ls --color -d {} \;

}

quick-backup(){

    cp $@ ~/backup

}

fehbg(){

    feh --bg-fill $1

}

grepword(){

    grep -rnw $1 -e $2

}

#===============
# Custom aliases
#===============

# Pacman
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Syyu'
alias paclog='less /var/log/pacman.log'
alias cdpacpkg='cd /var/cache/pacman/pkg'
alias pacconf='sudo vim /etc/pacman.conf'
alias pacinfo='pacman -Qi'
alias pacsrch='pacman -Ss'
alias packages='pacman -Q'

# Config files
alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vimrc'
alias vimprc='vim ~/.vimperatorrc'
alias awerc='vim ~/.config/awesome/rc.lua'
alias yahmantheme='vim ~/.config/awesome/themes/yahman/theme.lua'
alias rangerrc='vim ~/.config/ranger/rc.conf'
alias xinitrc='vim ~/.xinitrc'
alias xresources='vim ~/.Xresources'

# Mount
alias mount0='sudo mount /dev/sdb ~/USB -o uid=rio'
alias umount0='sudo umount /dev/sdb'
alias mount1='sudo mount /dev/sdb1 ~/USB -o uid=rio'
alias umount1='sudo umount /dev/sdb1'

# Git
alias gstat='git status'
alias gadd='git add --all'
alias gcommit='git commit -m'
alias gpush='git push origin master'
alias gdiff='git diff'
alias gitign='git ls-files --other --ignored --exclude-standar'

# Find
alias ffile='find-file'
alias fdir='find-dir'
alias ftype='find-by-file-type'
alias fname='find-by-name'
alias fap='find-and-play'

# Suffix aliases
alias -s pdf=zathura
alias -s tex=vim

# Other
alias RR='source ~/.zshrc && clear'
alias unpack='aunpack'
alias ls='ls -lh --color=auto'
alias tpfan='sudo tpfan-admin && clear'
alias conn='nmcli d'
alias music-downloader='youtube-dl --extract-audio --audio-format="mp3" --audio-quality=0 -o "~/Downloads/%(title)s.%(ext)s"'
alias hdparm='sudo hdparm -I /dev/sda | grep level'
alias pingg='ping google.com'
alias Q='exit'
alias htop='htop && clear'
alias wl='mpv-watch-later'
alias suspend='systemctl suspend'
alias calc='python -ic "from __future__ import division; from math import *; from random import *"'
alias svol='volume-switcher'
alias swifi='switch-wifi'
alias Ds='periscope -l en'
alias BB='quick-backup'
alias del='trash'
alias back='cd $OLDPWD'
alias tr='trash -r'
alias xrdbload='xrdb load .Xresources'
alias sww='swifi && startx'
alias usbcreator='gksudo usb-creator-gtk'
alias printer='system-config-printer'
alias fs='df -h | grep Filesystem && df -h | grep sda1 && df -h | grep home'
alias batcap='cat /sys/class/power_supply/BAT0/capacity'
alias batstat='cat /sys/class/power_supply/BAT0/status'
alias addtorrent='transmission-remote -a'
alias trc='transmission-remote-cli'
