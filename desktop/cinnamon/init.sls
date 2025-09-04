include:
  - desktop.cinnamon.disable_lock
  - desktop.cinnamon.disable_lock_screen
  - desktop.cinnamon.remove_bloat

install_desktop:
  pkg.installed:
    - names:
      - cinnamon
