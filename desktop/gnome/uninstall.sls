remove_gnome:
  cmd.run:
    - name: apt purge -y gnome-shell gnome-terminal gnome-tweaks gnome-session
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep '^gnome-shell')"
