enable_lightdm:
  cmd.run:
    - name: systemctl enable gdm3
    - unless: systemctl is-enabled gdm3
    - require:
      - pkg: gdm3