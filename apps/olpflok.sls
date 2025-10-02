olpflok-icon:
  file.managed:
    - name: /usr/share/icons/flok.svg
    - source: https://flok.cc/flok.svg
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - skip_verify: True

olpflok:
  file.managed:
    - name: /usr/share/applications/olpflok.desktop
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        [Desktop Entry]
        Version=1.0
        Name=OLP Flok
        Comment=Opens OLP Flok
        Exec=firefox-esr https://tinyurl.com/olpflok
        Icon=/usr/share/icons/flok.svg
        Terminal=false
        Type=Application
    - require:
      - file: olpflok-icon
