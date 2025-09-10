/etc/dconf/db/local.d/00-screensaver:
  file.managed:
    - contents: |
        [org/cinnamon/desktop/screensaver]
        lock-enabled=false
        idle-activation-enabled=false

        [org/cinnamon/desktop/session]
        idle-delay=uint32 0

        [org/gnome/desktop/session]
        idle-delay=uint32 0

        [org/gnome/desktop/screensaver]
        lock-enabled=false
        idle-activation-enabled=false
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True

/etc/dconf/profile/user:
  file.managed:
    - contents: |
        user-db:user
        system-db:local
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True

update-dconf-cinnamon:
  cmd.run:
    - name: dconf update
    - onlyif: test -n "$(find /etc/dconf/db/local.d/00-screensaver /etc/dconf/profile/user -mmin -2)"
    - require:
      - file: /etc/dconf/db/local.d/00-screensaver
      - file: /etc/dconf/profile/user
