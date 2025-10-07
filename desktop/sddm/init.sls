include:
  - desktop.sddm.service

exclude:
  - sls: desktop.gdm3

sddm:
  pkg.installed
