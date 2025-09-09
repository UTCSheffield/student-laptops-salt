remove_libreoffice:
  cmd.run:
    - name: apt purge -y libreoffice*
    - onlyif: test -n "$(apt list --installed 2>/dev/null | grep '^libreoffice')"