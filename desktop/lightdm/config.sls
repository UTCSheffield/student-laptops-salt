lightdm_config:
  file.managed:
    - name: /etc/lightdm/lightdm.conf.d/50-hide-users.conf
    - contents: |
        [Seat:*]
        greeter-hide-users=true
        greeter-show-manual-login=true
    - user: root
    - group: root
    - mode: '0644'