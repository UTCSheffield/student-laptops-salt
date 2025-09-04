remove_gdm:
  pkg.purged:
    - names:
      - gdm3
    - ignore_missing: True
    - require:
        - service: disable_gdm

disable_gdm:
  service.dead:
    - name: gdm
    - enable: False
    - require:
      - pkg: remove_gdm
