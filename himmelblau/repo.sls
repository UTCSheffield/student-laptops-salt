/etc/apt/sources.list.d/himmelblau.sources:
  file.managed:
    - mode: "0644"
    - user: root
    - group: root
    - contents: |
        Types: deb
        URIs: https://deb.archiesbytes.xyz/himmelblau-school
        Suites: debian13
        Components: main
        Signed-By: /usr/share/keyrings/himmelblau.gpg
    - require:
      - cmd: himmelblau_key

himmelblau_key:
  cmd.run:
    - name: |
        curl -fsSL https://deb.archiesbytes.xyz/iLikeToCode.gpg \
        | gpg --dearmor \
        | tee /usr/share/keyrings/himmelblau.gpg > /dev/null
    - creates: /usr/share/keyrings/himmelblau.gpg
    - require:
      - pkg: curl

apt_update_himmelblau:
  pkg.uptodate:
    - refresh: True
