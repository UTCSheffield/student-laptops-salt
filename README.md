# student-laptops-salt
Salt states for student laptops

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
