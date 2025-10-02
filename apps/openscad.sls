openscad:
  pkg.installed
  git.latest:
    - name: https://github.com/BelfrySCAD/BOSL2
    - target: /home/makerlab/.local/share/OpenSCAD/libraries/
    - user: myuser
    - branch: main
    - force_reset: True
    - rev: main  
