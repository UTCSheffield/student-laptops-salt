cinnamon_global_lockdown_logout:
  file.managed:
    - name: /etc/dconf/db/local.d/01-lockout
    - contents: |
        [org/cinnamon/desktop/lockdown]
        disable-log-out=true

cinnamon_lockdown_lockout:
  file.managed:
    - name: /etc/dconf/db/local.d/locks/disable-log-out
    - contents: |
        /org/cinnamon/desktop/lockdown/disable-log-out

update_dconf_logout:
  cmd.run:
    - name: dconf update
