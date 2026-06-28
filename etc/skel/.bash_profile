#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Inicia o Sway automaticamente no TTY1
if [ -z "$WAYLAND_DISPLAY" ] &&
  [ "${XDG_VTNR:-0}" -eq 1 ]; then

  # Auto-launch Sway on TTY1 login
  if [ "$(tty)" = "/dev/tty1" ]; then
    read -p "Start Sway? [y]es or [n]o: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      # Variáveis para garantir que aplicativos GTK/Qt respeitem o tema e o Wayland
      export QT_QPA_PLATFORM=wayland
      export MOZ_ENABLE_WAYLAND=1

      #exec dbus-run-session sway
      exec sway
    fi
  fi
fi
