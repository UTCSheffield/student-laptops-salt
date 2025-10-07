base:
  '*':
    - update_upgrade
    - salt_oneshot
    - desktop
    - apps.defaults
#    - himmelblau
    - makerlab_user
  'OLP-ML02':
    - desktop.sddm
