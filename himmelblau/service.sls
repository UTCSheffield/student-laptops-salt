himmelblaud-enable:
  cmd.run:
    - name: systemctl enable himmelblaud
    - unless: systemctl is-enabled himmelblaud
    - require:
      - pkg: himmelblau-packages

himmelblaud-tasks-enable:
  cmd.run:
    - name: systemctl enable himmelblaud-tasks
    - unless: systemctl is-enabled himmelblaud-tasks
    - require:
      - pkg: himmelblau-packages
