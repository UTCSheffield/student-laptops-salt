chromium:
  pkg.installed

/usr/share/applications/google.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        [Desktop Entry]
        Version=1.0
        Name=Google
        Comment=Open Google in Chromium
        Exec=chromium --new-window https://www.google.com
        Icon=chromium
        Terminal=false
        Type=Application
        Categories=Network;WebBrowser;
        StartupNotify=true
