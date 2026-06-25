#
# ~/.bash_profile
#

timenow="$(date +'%H:%M')"
load="$(awk '{print $1 ", " $2 ", " $3}' /proc/loadavg)"

printf '\e[0;35m%s\n\e[0m' "$logo"
printf 'Welcome back! The time now is %s UTC\n' "$timenow"
printf 'Server load    :  %s\n' "$load"
printf 'Server Uptime  : %s\n' "$(uptime)"
printf 'User           :  %s %s\n' "$(whoami)" "$(id)"
printf '\n'

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Inicia o Sway automaticamente no TTY1
if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
	# Variáveis para garantir que aplicativos GTK/Qt respeitem o tema e o Wayland
	export QT_QPA_PLATFORM=wayland
	export MOZ_ENABLE_WAYLAND=1

	exec sway
fi
