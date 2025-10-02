# makerclub.sls

makerclub-user:
  user.present:
    - name: makerclub
    - fullname: "MakerClub"
    - password: "$6$heeBufALMLcJ93l6$5dzmcXeDyLSqwD9UHF5CIpXL1I8oUTmoaBw24NGeWNliB1AcAGVnnif.uf7zVUcPn2r4pYP4zsjdwkEjBcWxF0"
    - shell: /bin/bash
    - home: /home/makerclub
    - createhome: True

# Ensure AccountsService icons directory exists
/var/lib/AccountsService/icons:
  file.directory:
    - user: root
    - group: root
    - mode: "0755"

# Copy your provided SVG into AccountsService icons (so DM/greeter can show it)
# Adjust source if your SLS uses fileserver roots or pillar; this assumes the file
# is placed in the salt files/ directory at salt://makerclub/makerclub_logo.svg
/var/lib/AccountsService/icons/makerclub:
  file.managed:
    - source: salt://makerclub_logo.svg
    - user: root
    - group: root
    - mode: "0644"
    - require:
      - file: /var/lib/AccountsService/icons

# Tell AccountsService which icon to use for the user
/var/lib/AccountsService/users/makerclub:
  file.managed:
    - user: root
    - group: root
    - mode: "0644"
    - contents: |
        [User]
        SystemAccount=false
        Icon=/var/lib/AccountsService/icons/makerclub
    - require:
      - user: makerclub-user
      - file: /var/lib/AccountsService/icons/makerclub
