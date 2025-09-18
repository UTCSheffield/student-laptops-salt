kde-plasma-desktop:
  pkg.installed

clear_kde_launchers:
  file.replace:
    - name: /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
    - pattern: '^launchers=.*'
    - repl: ''
    - backup: False
    - makedirs: True
