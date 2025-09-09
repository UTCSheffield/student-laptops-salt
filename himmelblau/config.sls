/etc/himmelblau/himmelblau.conf:
  file.managed:
    - contents: |
        [global]
        domains = utcsheffield.org.uk
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
