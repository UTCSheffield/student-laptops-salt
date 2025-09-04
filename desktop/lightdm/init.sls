include:
  - desktop.lightdm.service
  - desktop.lightdm.config

lightdm:
  pkg.installed:
    - names:
      - lightdm
      - lightdm-gtk-greeter