lightdm_enable:
  cmd.run:
    - name: systemctl enable lightdm
    - unless: systemctl is-enabled lightdm
    - require:
      - pkg: lightdm
