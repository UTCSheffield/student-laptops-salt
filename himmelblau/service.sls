himmelblaud-service:
  service.enabled:
    - name: himmelblaud
    - require:
      - pkg: himmelblau-packages
    
himmelblaud-tasks-service:
  service.enabled:
    - name: himmelblaud-tasks
    - require:
      - pkg: himmelblau-packages
