/etc/himmelblau/himmelblau.conf:
  file.managed:
    - contents: |
        [global]
        domains = utcsheffield.org.uk
        sudo_groups = 8b84e594-3ad4-4e24-b578-96f4365fecb2
        entra_id_password_prompt = Enter your school password
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
