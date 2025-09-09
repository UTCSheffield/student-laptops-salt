enable_himmelblaud:
  cmd.run:
    - name: systemctl enable himmelblaud
    - unless: systemctl is-enabled himmelblaud
    - require:
      - pkg: himmelblau_packages

enable_himmelblaud_tasks:
  cmd.run:
    - name: systemctl enable himmelblaud-tasks
    - unless: systemctl is-enabled himmelblaud-tasks
    - require:
      - pkg: himmelblau_packages
