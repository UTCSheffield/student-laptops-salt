include:
  - desktop.cinnamon.disable_lock
  - desktop.cinnamon.disable_lock_screen

install_desktop:
  pkg.installed:
    - names:
      - cinnamon
