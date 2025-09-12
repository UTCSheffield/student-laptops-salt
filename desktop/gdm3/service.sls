disable_gdm:
  cmd.run:
    - name: systemctl disable gdm3
    - onlyif: systemctl is-enabled gdm3
