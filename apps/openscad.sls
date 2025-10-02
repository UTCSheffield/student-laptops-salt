openscad:
  pkg.installed

bosl2:
  git.latest:
    - name: https://github.com/BelfrySCAD/BOSL2
    - target: /home/makerlab/.local/share/OpenSCAD/libraries/BOSL2
    - user: makerlab
    - branch: main
    - force_reset: True
    - rev: main  
