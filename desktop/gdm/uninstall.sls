remove_gdm:
  pkg.purged:
    - names:
      - gdm3
    - require:
        - service: disable_gdm

disable_gdm:
  service.dead:
    - name: gdm
    - enable: False
