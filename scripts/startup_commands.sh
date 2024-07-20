# mount external disk
udisksctl mount -b /dev/sdb1
# mount on log in


#-2 start redshift
redshift &
# this does not start the GUI redshift-gtk


#-3 Start conky
#!/usr/bin/env bash
# add this file to startup
## Wait 10 seconds
sleep 20
## Run conky
conky -c ~/.conky/erm.conkyrc

