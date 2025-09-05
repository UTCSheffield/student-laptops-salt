include:
  - himmelblau.repo
  - himmelblau.service
  - himmelblau.config

himmelblau-packages:
  pkg.installed:
    - pkgs:
      - himmelblau
      - himmelblau-sso
      - nss-himmelblau
      - pam-himmelblau
    - require:
       - file: /etc/apt/sources.list.d/himmelblau.sources
