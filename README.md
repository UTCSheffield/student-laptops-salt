# student-laptops-salt
Salt states for student laptops

## Debian Preseed
```
d-i firmware-setup/nonfree boolean true

## Network
d-i netcfg/enable boolean true
d-i netcfg/choose_interface select auto

# Do not ask for hostname or domain
d-i netcfg/get_hostname seen true
d-i netcfg/get_domain seen true

## Accounts
d-i passwd/root-login boolean false
d-i passwd/user-fullname string Administrator
d-i passwd/username string administrator
d-i passwd/user-password password administrator
d-i passwd/user-password-again password administrator


## Clock and Timezone
d-i clock-setup/utc boolean true
d-i time/zone string Europe/London

## Partitioning
d-i partman-auto/method string regular
d-i partman-auto/disk string /dev/sda
d-i partman-auto/choose_recipe select atomic

d-i partman-lvm/device_remove_lvm boolean true
d-i partman-md/device_remove_md boolean true
d-i partman/confirm_write_new_label boolean true
d-i partman/choose_partition select finish
d-i partman/confirm boolean true
d-i partman/confirm_nooverwrite boolean true
d-i partman-auto-crypto/erase_disks boolean true

d-i grub-installer/only_debian boolean true
d-i grub-installer/with_other_os boolean false
d-i grub-installer/bootdev string /dev/sda

## Base System
d-i base-installer/install-recommends boolean false

## APT Setup
d-i apt-setup/non-free-firmware boolean true
d-i apt-setup/non-free boolean true
d-i apt-setup/contrib boolean true
d-i apt-setup/disable-cdrom-entries boolean true
d-i apt-setup/use_mirror boolean true

## Post-Install
d-i preseed/late_command string \
  in-target mkdir -p /etc/apt/keyrings; \
  in-target wget -qO /etc/apt/keyrings/salt-archive-keyring.pgp https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public; \
  in-target wget -qO /etc/apt/sources.list.d/salt.sources https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources; \
  in-target apt-get update && apt-get upgrade -y; \
  in-target apt-get install -y salt-minion git; \
  in-target systemctl disable --now salt-minion; \
  in-target mkdir -p /etc/salt/minion.d; \
  in-target sh -c 'printf "file_client: local\nfile_roots:\n  base:\n    - /srv/salt/states\n" > /etc/salt/minion.d/masterless.conf'; \
  in-target mkdir -p /srv/salt/states; \
  in-target git clone https://github.com/UTCSheffield/student-laptops-salt.git /srv/salt/states || true; \
  in-target salt-call --local state.highstate --state-verbose=false

## Finish
d-i finish-install/reboot_in_progress note
d-i debian-installer/exit/reboot boolean true
```

## IPXE Script
```
#!ipxe
dhcp

echo -n Hostname: && read hostname

set base-url http://${next-server}

kernel ${base-url}/linux quiet auto url=${base-url}/preseed.cfg priority=critical hostname=${hostname} language=en locale=en_GB.UTF-8 console-setup/ask_detect=false console-setup/layoutcode=gb keyboard-configuration/xkb-keymap=gb keyboard-configuration/layoutcode=gb interface=auto country=GB
initrd ${base-url}/initrd.gz

boot
```
