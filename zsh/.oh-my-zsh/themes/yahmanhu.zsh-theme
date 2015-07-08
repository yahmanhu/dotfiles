bat_status() {
    bat_stat=$(cat /sys/class/power_supply/BAT0/status)
    bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)

    if [[ $bat_stat == "Charging" ]]; then
        echo "\e[32m⚡"
    elif [[ $bat_stat == "Discharging" ]] && [[ $bat_cap == "30" ]] || [[ $bat_cap < "30" ]]; then
        echo "\e[91m⚡"
    elif [[ $bat_stat == "Discharging" ]] && [[ $bat_cap > "30" ]]; then
        echo "\e[37m⚡"
    fi
         
}

bat_capacity() {
    bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "\e[37m$bat_cap"
}

wifi() {

    wifi_state=$(cat /sys/class/net/wlp3s0/operstate)

    if [[ $wifi_state == "up" ]]; then
        echo "\e[32mwi-fi"
    else
        echo "\e[37mwi-fi"
    fi

}

ethernet() {

    eth_state=$(cat /sys/class/net/enp4s0/operstate)

    if [[ $eth_state == "up" ]]; then
        echo "\e[32mwired"
    else
        echo "\e[37mwired"
    fi

}

volume() {

    vol_state=$(amixer get Master | egrep Playback | egrep -o off)

    if [[ $vol_state == "off" ]]; then
        echo "\e[37m♬"
    else
        echo "\e[32m♬"
    fi
}

keyboard() {

    check_layout=$(setxkbmap -query | grep 'layout')

    if [[ $check_layout = *"hu"* ]]; then
        echo "\e[37mhu ↵"
    elif [[ $check_layout = *"gb"* ]]; then
        echo "\e[37mgb ↵"
    fi

}


local ret_status="%(?:%{$fg_bold[yellow]%}[%T] :%{$fg_bold[red]%}[%T] %s)"
PROMPT='${ret_status}$(keyboard) $(volume) $(bat_status) $(bat_capacity) $(ethernet) $(wifi) %{$fg_bold[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
RPROMPT="%(?:%{$fg_bold[yellow]%}[%D{ %A %B %d %Y }] :%{$fg_bold[red]%}[%D{ %A %B %d %Y }] %s)"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓%{$reset_color%}"
