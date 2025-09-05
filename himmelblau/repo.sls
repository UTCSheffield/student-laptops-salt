/etc/apt/sources.list.d/himmelblau.sources:
  file.managed:
    - mode: "0644"
    - user: root
    - group: root
    - contents: |
        Types: deb
        URIs: https://deb.archiesbytes.xyz/himmelblau
        Suites: debian12
        Components: main
        Signed-By: /usr/share/keyrings/himmelblau.gpg

himmelblau_key:
  cmd.run:
    - name: |
        curl -fsSL https://himmelblau-idm.org/himmelblau.asc \
        | gpg --dearmor \
        | tee /usr/share/keyrings/himmelblau.gpg > /dev/null
    - creates: /usr/share/keyrings/himmelblau.gpg
