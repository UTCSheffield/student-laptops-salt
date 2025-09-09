include:
  - desktop.gdm3.service
  - desktop.gdm3.config

gdm3:
  pkg.installed:
    - require:
      - pkg: remove_gnome
