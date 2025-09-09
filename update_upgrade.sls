apt_update:
  pkg.uptodate:
    - refresh: True

apt_upgrade:
  cmd.run:
    - name: apt upgrade -y
    - onlyif: test -n "$(apt list --upgradable 2>/dev/null | tail -n +2)"
    - require:
      - pkg: apt_update
