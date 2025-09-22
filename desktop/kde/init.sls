kde-plasma-desktop:
  pkg.installed

/etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc:
  file.managed:
    - source: salt://desktop/kde/plasma-org.kde.plasma.desktop-appletsrc
    - makedirs: True
