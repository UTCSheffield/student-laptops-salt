install_libtss2_mu_dummy:
  pkg.installed:
    - name: equivs

create_libtss2_mu0_dummy_dir:
  file.directory:
    - name: /tmp/libtss2-mu0-dummy
    - makedirs: True

create_libtss2_mu0_control:
  file.managed:
    - name: /tmp/libtss2-mu0-dummy/libtss2-mu0
    - contents: |
        Section: misc
        Priority: optional
        Standards-Version: 3.9.2

        Package: libtss2-mu0
        Version: 1.0
        Provides: libtss2-mu0
        Depends: libtss2-mu-4.0.1-0
        Architecture: all
        Description: Dummy package to satisfy himemlblau dependency

build_libtss2_mu0_dummy:
  cmd.run:
    - name: equivs-build libtss2-mu0
    - cwd: /tmp/libtss2-mu0-dummy
    - creates: /tmp/libtss2-mu0-dummy/libtss2-mu0_1.0_all.deb
    - require:
      - file: create_libtss2_mu0_control
      - pkg: install_libtss2_mu_dummy

install_libtss2_mu0_dummy:
  pkg.installed:
    - sources:
      - libtss2-mu0: /tmp/libtss2-mu0-dummy/libtss2-mu0_1.0_all.deb
    - require:
      - cmd: build_libtss2_mu0_dummy
