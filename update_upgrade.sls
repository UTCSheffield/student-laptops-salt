apt_update:
  pkg.uptodate:
    - refresh: True

apt_upgrade:
  cmd.run:
    - name: apt upgrade -y
    - onlyif: test -n "$(apt list --upgradable 2>/dev/null | tail -n +2)"
    - require:
      - pkg: apt_update

apt_autoremove:
  cmd.run:
    - name: apt autoremove --purge -y
    - onlyif: test -n "$(apt -s autoremove | grep 'Remv')"
    - require:
      - cmd: apt_upgrade