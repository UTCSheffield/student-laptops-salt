remove_gnome_shell:
  cmd.run:
    - name: apt purge -y gnome-shell
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-shell/')"

remove_gnome_tweaks:
  cmd.run:
    - name: apt purge -y gnome-tweaks
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-tweaks/')"

remove_gnome_session:
  cmd.run:
    - name: apt purge -y gnome-session
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep -E '^gnome-session/')"
