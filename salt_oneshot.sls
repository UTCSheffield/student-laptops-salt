salt_oneshot:
  file.managed:
    - name: /etc/systemd/system/salt-highstate.service
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        [Unit]
        Description=Salt Highstate Sync on Boot
        After=network-online.target
        Wants=network-online.target

        [Service]
        Type=oneshot
        ExecStart=/bin/sh -c 'cd /srv/salt/states && git reset --hard && git pull -q --rebase && salt-call --local state.highstate --state-verbose=false'

        [Install]
        WantedBy=multi-user.target

  cmd.run:
    - name: systemctl daemon-reload && systemctl enable salt-highstate.service
    - unless: systemctl is-enabled salt-highstate.service
