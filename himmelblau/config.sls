himmelblau-config:
  file.managed:
    - name: /etc/himmelblau/himmelblau.conf
    - user: root
    - group: root
    - mode: "0644"
    - require:
      - pkg: himmelblau-packages

lightdm_config:
  file.managed:
    - name: /etc/lightdm/lightdm.conf.d/50-hide-users.conf
    - contents: |
        [global]
        domains = utcsheffield.org.uk
        enable_hello = false
        enable_sfa_fallback = true
        enable_experimental_passwordless_fido = false
        enable_experimental_intune_custom_compliance = false
        apply_policy = false
    - user: root
    - group: root
    - mode: '0644'
    - require:
      - pkg: himmelblau-packages