remove_gnome_desktop:
  pkg.purged:
    - names:
      - gnome-desktop-environment
    - ignore_missing: True

autoremove_orphans:
  cmd.run:
    - name: apt-get autoremove -y
    - require:
      - pkg: remove_gnome_desktop
