enable_gdm:
  cmd.run:
    - name: systemctl enable gdm3
    - unless: systemctl is-enabled gdm3
