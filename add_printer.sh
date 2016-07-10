#!/bin/bash


# Remove any currently installed printers

lpstat -p | awk '{print $2}' | while read printer

    do

        echo "Deleting Printer:" $printer

        lpadmin -x $printer

    done


# Add Printers  

/usr/sbin/lpadmin -p QUEUENAME -o printer-is-shared="False" -E -v lpd://10.10.1.200 -P /Library/Printers/PPDs/Contents/Resources/Kyocera\ FS-C8500DN.PPD -D "Color"

    echo "Added Color printer"

/usr/sbin/lpadmin -p QUEUENAME2 -o printer-is-shared="False" -E -v lpd://10.10.1.201 -P /Library/Printers/PPDs/Contents/Resources/Kyocera\ FS-1320D.PPD -D "Black"

    echo "Added Black printer"


