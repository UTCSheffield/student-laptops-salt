/usr/share/applications/o365-apps.desktop:
  file.absent

/usr/share/applications/o365-onedrive.desktop:
  file.absent

/usr/share/applications/o365-sharepoint.desktop:
  file.absent

{%- set apps = salt['file.readdir']('/usr/share/applications') %}
{%- set o365_apps = apps | select('match', '^o365-.*\\.desktop$') | list %}

{%- for app in o365_apps %}
copy_{{ app }}_to_skel:
  file.copy:
    - name: /etc/skel/Desktop/{{ app }}
    - source: /usr/share/applications/{{ app }}
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True
    - require:
      - file: /usr/share/applications/o365-apps.desktop
      - file: /usr/share/applications/o365-onedrive.desktop
      - file: /usr/share/applications/o365-sharepoint.desktop
{%- endfor %}

{%- set user_homes = salt['file.find']('/home', type='d', maxdepth=1) %}
{%- for user_home in user_homes %}
{%- set username = user_home.split('/')[-1] %}
{%- if username not in ['.', '..'] %}
  {%- for app in o365_apps %}
copy_{{ username }}_{{ app }}:
  file.copy:
    - name: {{ user_home }}/Desktop/{{ app }}
    - source: /usr/share/applications/{{ app }}
    - user: {{ username }}
    - group: {{ username }}
    - mode: '0644'
    - makedirs: True
    - require:
      - file: /usr/share/applications/o365-apps.desktop
      - file: /usr/share/applications/o365-onedrive.desktop
      - file: /usr/share/applications/o365-sharepoint.desktop
  {%- endfor %}
{%- endif %}
{%- endfor %}
