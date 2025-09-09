remove_gnome_sessions:
  file.absent:
    - name: /usr/share/xsessions/gnome.desktop

remove_gnome_wayland_session:
  file.absent:
    - name: /usr/share/xsessions/gnome-wayland.desktop

remove_gnome_terminal:
  cmd.run:
    - name: apt purge -y gnome-terminal
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-terminal/')"

remove_gnome_tweaks:
  cmd.run:
    - name: apt purge -y gnome-tweaks
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-tweaks/')"

remove_gnome_session:
  cmd.run:
    - name: apt purge -y gnome-session
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-session/')"
