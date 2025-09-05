cinnamon_global_lockdown:
  file.managed:
    - name: /etc/dconf/db/local.d/00-lockdown
    - contents: |
        [org/cinnamon/desktop/lockdown]
        disable-lock-screen=true
    - makedirs: True

cinnamon_lockdown_lock:
  file.managed:
    - name: /etc/dconf/db/local.d/locks/disable-lock-screen
    - contents: |
        /org/cinnamon/desktop/lockdown/disable-lock-screen
    - makedirs: True

update_dconf:
  cmd.run:
    - name: dconf update
