/usr/share/applications/o365-apps.desktop:
  file.absent

/usr/share/applications/o365-onedrive.desktop:
  file.absent

/usr/share/applications/o365-sharepoint.desktop:
  file.absent

{%- set apps = salt['file.readdir']('/usr/share/applications') %}
{%- for app in apps if app.startswith('o365-') and app.endswith('.desktop') %}

copy_{{ app }}_to_skel:
  file.copy:
    - name: /etc/skel/Desktop/{{ app }}
    - source: /usr/share/applications/{{ app }}
    - user: root
    - group: root
    - mode: '0644'
    - makedirs: True

{%- endfor %}

{%- set user_homes = salt['file.find']('/home', type='d', maxdepth=1) %}
{%- for user_home in user_homes %}
{%- set username = user_home.split('/')[-1] %}

{%- for app in o365_apps %}
copy_{{ username }}_{{ app }}:
  file.copy:
    - name: {{ user_home }}/Desktop/{{ app }}
    - source: /usr/share/applications/{{ app }}
    - user: {{ username }}
    - group: {{ username }}
    - mode: '0644'
    - makedirs: True
{%- endfor %}
{%- endfor %}

/etc/himmelblau/himmelblau.conf:
  file.managed:
    - contents: |
        [global]
        domains = utcsheffield.org.uk
        sudo_groups = ec347101-1662-45e7-9a23-af563643ae76
        entra_id_password_prompt = Enter your school password
        enable_hello = false
        enable_sfa_fallback = true
        enable_experimental_passwordless_fido = false
        enable_experimental_intune_custom_compliance = false
        apply_policy = false
        use_etc_skel = true
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: himmelblau_packages
    - makedirs: True
