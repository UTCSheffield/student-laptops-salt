pkgrepo.managed:
    - humanname: Google Chrome
    - name: deb http://deb.archiesbytes.xyz/himmelblau/ stable main
    - dist: stable
    - file: /etc/apt/sources.list.d/himmelblau.list
    - require_in:
      - pkg: himmelblau-packages
    - gpgcheck: 1
    - key_url: https://himmelblau-idm.org/himmelblau.asc

himmelblau-packages:
  pkg.installed:
    - pkgs:
      - himmelblau
      - himmelblau-sso
      - nss-himmelblau
      - pam-himmelblau