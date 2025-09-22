{% set patterns = [
  '/usr/share/applications/org.gnome.*',
  '/usr/share/applications/gnome*',
  '/usr/share/applications/debian-uxterm.desktop',
  '/usr/share/applications/debian-xterm.desktop'
] %}

{% set files_to_remove = [] %}
{% for pat in patterns %}
  {% for f in salt['file.find']('/usr/share/applications', name=pat) %}
    {% do files_to_remove.append(f) %}
  {% endfor %}
{% endfor %}

remove_gnome_desktop_files:
  file.absent:
    - names: {{ files_to_remove }}
