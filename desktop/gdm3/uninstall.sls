disable_gdm:
  cmd.run:
    - name: systemctl disable gdm3
    - onlyif: systemctl is-enabled gdm3

gdm3:
  pkg.purged:
    - require:
      - service: disable_gdm
