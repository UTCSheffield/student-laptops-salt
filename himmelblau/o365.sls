/usr/share/applications/o365-apps.desktop:
  file.absent

/usr/share/applications/o365-onedrive.desktop:
  file.absent

/usr/share/applications/o365-sharepoint.desktop:
  file.absent

{%- set apps = salt['file.readdir']('/usr/share/applications') %}
{%- set o365_apps = apps 
     | select('match', '^o365-.*\\.desktop$') 
     | reject('in', ['o365-apps.desktop','o365-onedrive.desktop','o365-sharepoint.desktop']) 
     | list %}

{%- for app in o365_apps %}
copy_{{ app }}_to_skel:
  file.copy:
    - name: /etc/skel/Desktop/{{ app }}
    - source: /usr/share/applications/{{ app }}
    - user: root
    - group: root
    - mode: '0755'
    - makedirs: True
{%- endfor %}
