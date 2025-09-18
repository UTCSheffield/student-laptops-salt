chromium:
  pkg.installed

/etc/chromium/policies/managed/google-search.json:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - contents: |
        {
          "DefaultSearchProviderEnabled": true,
          "DefaultSearchProviderName": "Google",
          "DefaultSearchProviderKeyword": "google.com",
          "DefaultSearchProviderSearchURL": "https://www.google.com/search?q={searchTerms}",
          "DefaultSearchProviderSuggestURL": "https://www.google.com/complete/search?output=chrome&q={searchTerms}",
          "DefaultSearchProviderIconURL": "https://www.google.com/favicon.ico"
        }

/usr/share/applications/chromium.desktop:
  file.managed:
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        [Desktop Entry]
        Version=1.0
        Name=Google Chrome
        Comment=Browse the internet
        Exec=chromium --new-window https://google.com
        Icon=chromium
        Terminal=false
        Type=Application
        Categories=Network;WebBrowser;
        StartupNotify=true

/usr/share/applications/chromium.desktop:
  file.absent
