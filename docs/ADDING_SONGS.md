# Adding songs
This may look challenging at first because this is an embedded system image and you can't just open your browser like you would on your windows machine running stepmania, this may seem complicated at first sight but it's actually pretty simple once you understand the process.

# Requirements
- A `scp` or `sftp` client, on windows you can use `WinSCP` or `FileZilla`, macOS has a CLI `scp` client but if you're not comfortable with using it you can use `FileZilla` too.
- A keyboard with a scroll-lock key connected to your arcade machine will make this easier

# Instructions
Once stepmania is started you won't be able to edit songs because the songs partition containing `Songs` and `BGAnimations` is mounted as Read Only to prevent data corruption in an arcade setting.
The easiest way to remount the partion in Read Write mode is to press the operator button which by default is the `scroll-lock` key, change the theme to the operator version and exit stepmania from the menu.
If your keyboard doesn't have a scroll-lock button or you don't have a keyboard at all over ssh (or pressing Ctrl+Alt+F2 you can either kill stepmania using htop or more simply run the command `sudo mount -o remount,rw /mnt/Songs`) to remount the songs partition as RW
At this point you should be able to connect to the machine, if you don't know your ip you can use your keyboard to type the command `ip a` which will display the IPs assigned to all your network interfaces.

Default settings for FileZilla are:
- Host: sftp://YOURIPHERE
- Username: itg
- Password: stepmania
- Port: 22

Default settings for WinSCP are:
- File protocol: SFTP
- Host name: YOURIPHERE
- Port number: 22
- User name: itg
- Password: stepmania

Your scp remote location will be `itg@YOURIPHERE:/mnt/Songs/Songs` or `itg@YOURIPHERE:/mnt/Songs/BGAnimations`

At this point on your sftp client you should navigate to /mnt/Songs/Songs (or /mnt/Songs/BGAnimations if you want to add those) and add your songs like you would on regular stepmania (eg. following the format PACK Folder/SONGNAME Folder/CHART files).
When you are done you should run a `sudo reboot` to ensure you get back in a RO situation and to reload all songs (which will take a while if you added a bunch, not to worry, FastLoad is set on so this will take this long only the first time). If your system is running in a public location don't forget to change the theme back to the arcade version to prevent people from quitting the game, editing options or entering the edit chart mode.
