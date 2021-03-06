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
        echo "wi-fi"
    else
        :
    fi

}

ethernet() {

    eth_state=$(cat /sys/class/net/enp4s0/operstate)

    if [[ $eth_state == "up" ]]; then
        echo "wired"
    else
        :
    fi

}

volume() {

    vol_state=$(amixer get Master | egrep Playback | egrep -o off)

    if [[ $vol_state == "off" ]]; then
    :
    else
        echo "vol"
    fi
}

mount() {

    if [[ -d /run/media/$USER/* ]]; then
        echo "USB Mounted"
    else
        :
    fi

}

cursor(){

    echo -e "\033[?17;0;127c"

}

local ret_status="%(?:%{$fg_bold[white]%}[%T] :%{$fg_bold[red]%}[%T] %s)"
PROMPT='%B%{$fg_bold[green]%} %{$fg_bold[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[black]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}*%{$reset_color%}"
