kde-plasma-desktop:
  pkg.installed

# kde_clear_launchers.sls

kde_skeldir:
  file.directory:
    - name: /etc/skel/.config
    - makedirs: True
    - user: root
    - group: root
    - mode: '0755'

kde_skelfile_present:
  cmd.run:
    - name: test -f /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc || touch /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
    - require:
      - file: kde_skeldir

clear_kde_launchers:
  file.replace:
    - name: /etc/skel/.config/plasma-org.kde.plasma.desktop-appletsrc
    - pattern: '^launchers=.*'
    - repl: ''
    - backup: False
    - show_changes: True
    - require:
      - cmd: kde_skelfile_present
