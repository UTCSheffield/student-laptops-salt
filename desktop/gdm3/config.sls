/usr/share/backgrounds/login.svg:
  file.managed:
    - source: https://www.utcsheffield.org.uk/olp/assets/sites/3/2021/07/UTC-Sheffield-Olympic-Legacy-Park-Horizontal.svg
    - user: root
    - group: root
    - mode: '0644'
    - skip_verify: True
    - require:
      - pkg: gdm3
    - makedirs: True

/etc/gdm3/greeter.dconf-defaults:
  file.managed:
    - contents: |
        [org/gnome/login-screen]
        disable-user-list=true
        [org/gnome/desktop/background]
        picture-uri='file:///usr/share/backgrounds/login.svg'
        picture-options='zoom'
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: gdm3
    - makedirs: True

/etc/gdm3/daemon.conf:
  file.managed:
    - contents: |
        [daemon]
        DefaultSession=cinnamon
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: gdm3
    - makedirs: True

update-dconf-gdm:
  cmd.run:
    - name: dconf update
    - onlyif: test -n "$(find /etc/gdm3/greeter.dconf-defaults /etc/gdm3/daemon.conf -mmin -2)"
    - require:
      - file: /etc/gdm3/greeter.dconf-defaults
      - file: /etc/gdm3/daemon.conf
