enable_sddm:
  cmd.run:
    - name: systemctl enable sddm
    - unless: systemctl is-enabled sddm
