bat_status() {
    bat_stat=$(cat /sys/class/power_supply/BAT0/status)
    bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)

    if [[ $bat_stat == "Charging" ]]; then
        echo "\e[94m$bat_cap"
    elif [[ $bat_stat == "Discharging" ]] && [[ $bat_cap == "30" ]] || [[ $bat_cap < "30" ]]; then
        echo "\e[91m$bat_cap"
    elif [[ $bat_stat == "Discharging" ]] && [[ $bat_cap > "30" ]]; then
        echo "\e[37m$bat_cap"
    fi
         
}

wifi() {

    wifi_state=$(cat /sys/class/net/wlp3s0/operstate)

    if [[ $wifi_state == "up" ]]; then
        echo " \e[32mwi-fi"
    else
        :
    fi

}

ethernet() {

    eth_state=$(cat /sys/class/net/enp4s0/operstate)

    if [[ $eth_state == "up" ]]; then
        echo "\e[32mwired"
    else
        :
    fi

}

volume() {

    vol_state=$(amixer get Master | egrep Playback | egrep -o off)

    if [[ $vol_state == "off" ]]; then
        :
    else
        echo "\e[95m vol"
    fi
}

keyboard() {

    check_layout=$(setxkbmap -query | grep 'layout')

    if [[ $check_layout = *"hu"* ]]; then
        echo "\e[37mhu"
    elif [[ $check_layout = *"gb"* ]]; then
        echo "\e[37mgb"
    fi

}

mount() {

    if [[ "$(ls ~/USB)" == "total 0" ]]; then
        :
    else
        echo "\e[91mUSB Mounted "
    fi

}

TMOUT=60

TRAPALRM() {
    zle reset-prompt
}

local ret_status="%(?:%{$fg_bold[yellow]%}[%D{%a.%m.%d.%y}][%T] :%{$fg_bold[red]%}[%D{%a.%m.%d.%y}][%T] %s)"
PROMPT='${ret_status}$(mount)$(keyboard) $(bat_status)$(volume) $(ethernet)$(wifi) %{$fg_bold[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓%{$reset_color%}"
