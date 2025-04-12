# Debian installation
*these settings were prooftested using: `debian-12.10.0-amd64-netinst.iso` SHA256: `ee8d8579128977d7dc39d48f43aec5ab06b7f09e1f40a9d98f2a9d149221704a`* 

Debian should be installed with the following settings in LEGACY MODE (unless you are sure you will only use this drive with UEFI systems, instructions below may differ slightly): 
- Language: `English` (other languages should also work but for the sake of consistency you really should use English)
- Country, territory or area: Whatever you desire, you should choose your general location (for instance I chose other>Europe>Netherlands)
- Locale settings: `United States - en_US.UTF-8` (you may not be prompted for this)
- Keymap: `American English` (other layouts may work but especially if your cab uses keyboard inputs for stepmania you'll do yourself a favour by using the US layout)
- Primary Network Interface: choose yours, you may not be prompted with options if your system only has one.
- Hostname: `itg` (you must use this hostname for the scripts to work.)
- Domain name: (leave this on whatever the default setting happens to be, it should pick up what your network uses via DHCP.)
- Root password: `` (leave this empty as debian will disable the root user and give your user sudo privileges).
- Full name for the new user: `itg`
- Username for your account: `itg`
- Password for the new user: `stepmania` (you may want to choose something more secure depending on your specific setup)
- Timezone: select your own timezone, I chose `Europe/Amsterdam` as it is the closest to my machine
- Partitioning method: `Guided - use entire disk and set up LVM` *NOTE: it is very important you do this, it will be necessary later for the song section of the drive*
- Disk to partition: whatever the drive you want to install `/` (which includes the rootfs and usually in legacy scenarios is the drive where your boot sector will be) on is
- Partitioning scheme: `All files in one partition`
- Amount of volume group to use for guided partitioning: `5GB`
- Archive mirror country: whatever country your system will be used in, in my case `Netherlands`
- Archive mirror: whatever you prefer, in my case I chose the first option on the list
- HTTP proxy: `` in most cases this will be left blank unless you need to set up something else here
- Package usage survey: `No` (sorry debian devs)
- Choose software to install: `SSH server, standard system utilities` (everything else should be off, even `Debian desktop enviroment`)
- Install the GRUB boot loader to your primary drive?: `Yes`
- Device for boot loader installation: select your device here, in my case `/dev/sda`

Your operating system should now be correctly installed when you reach a login prompt, continue to `ITG_INSTALL.md`
