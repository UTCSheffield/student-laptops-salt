kde-desktop:
  pkg.installed:
    - pkgs:
      - kde-plasma-desktop
      - sddm

sddm-config:
  file.managed:
    - name: /etc/sddm.conf
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        [Theme]
        Current=breeze

        [Users]
        HideUsers=*
        RememberLastUser=false

        [General]
        HaltCommand=/usr/bin/systemctl poweroff
        RebootCommand=/usr/bin/systemctl reboot

plasma-no-lock:
  file.managed:
    - name: /etc/xdg/kscreenlockerrc
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        [Daemon]
        Autolock=false
        LockOnResume=false

plasma-logout:
  file.managed:
    - name: /etc/xdg/ksmserverrc
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        [General]
        confirmLogout=false
        shutdownType=2

sddm-service:
  service.enabled:
    - name: sddm
    - require:
      - pkg: kde-desktop
