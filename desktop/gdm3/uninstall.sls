include:
  - desktop.gdm3.service

gdm3:
  pkg.purged:
    - require:
      - service: disable_gdm
