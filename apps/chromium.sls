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
        Name=Google Chrome
        Comment=Browse the internet
        Exec=chromium --new-window https://www.google.com --search "https://www.google.com/search?q=%s"
        Icon=chromium
        Terminal=false
        Type=Application
        Categories=Network;WebBrowser;
        StartupNotify=true

/usr/share/applications/chromium.desktop:
  file.absent
