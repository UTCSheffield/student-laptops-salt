cinnamon_global_lockdown_logout:
  file.managed:
    - name: /etc/dconf/db/local.d/01-lockout
    - contents: |
        [org/cinnamon/desktop/lockdown]
        disable-log-out=true
    - makedirs: True

cinnamon_lockdown_lockout:
  file.managed:
    - name: /etc/dconf/db/local.d/locks/disable-log-out
    - contents: |
        /org/cinnamon/desktop/lockdown/disable-log-out
    - makedirs: True

update_dconf_logout:
  cmd.run:
    - name: dconf update
