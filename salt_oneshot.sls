salt_oneshot_gdm:
  file.managed:
    - name: /etc/gdm3/PostLogin/01-salt-highstate
    - user: root
    - group: root
    - mode: '0755'
    - contents: |
        #!/bin/sh
        # Run Salt Highstate on GDM login
        cd /srv/salt/states || exit 1
        git reset --hard
        git pull -q --rebase
        salt-call --local state.highstate --state-verbose=false
