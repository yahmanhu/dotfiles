bat_status() {

    bat_stat=$(cat /sys/class/power_supply/BAT0/status)
    bat_cap=$(cat /sys/class/power_supply/BAT0/capacity)

    if [[ $bat_stat == "Charging" ]] || [[ $bat_stat == "Full" ]]; then
        echo "\e[32m$bat_cap"
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
        echo "\e[95mvol"
    fi
}

mount() {

    if [[ "$(ls ~/USB)" == "total 0" ]]; then
        :
    else
        echo "\e[91mUSB Mounted "
    fi

}

cursor(){

    echo -e "\033[?17;0;127c"

}

TMOUT=60

TRAPALRM() {

    zle reset-prompt
}


local ret_status="%(?:%{$fg_bold[white]%}[%T] :%{$fg_bold[red]%}[%T] %s)"
PROMPT='$(cursor)%B--%T-- [ $(bat_status)$fg[white] ] $(mount)$(volume) $(ethernet)$(wifi) %{$fg_bold[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}✓%{$reset_color%}"
