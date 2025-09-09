/etc/gdm3/greeter.dconf-defaults:
  file.managed:
    - contents: |
        [org/gnome/login-screen]
        disable-user-list=true
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
