remove_gnome:
  cmd.run:
    - name: apt purge -y gnome*
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep '^gnome')"
