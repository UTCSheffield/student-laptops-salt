olpstrudel-icon:
  file.managed:
    - name: /usr/share/icons/olpstrudel.png
    - source: https://utcsheffield.github.io/makerclub-strudel/favicon.ico
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - skip_verify: True

olpstrudel:
  file.managed:
    - name: /usr/share/applications/olpflok.desktop
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        [Desktop Entry]
        Version=1.0
        Name=Makerclub Strudel
        Comment=OLP Makerclub Strudel Workshop
        Exec=firefox-esr https://tinyurl.com/makerclubmusic
        Icon=/usr/share/icons/olpstrudel.png
        Terminal=false
        Type=Application
    - require:
      - file: olpflok-icon
