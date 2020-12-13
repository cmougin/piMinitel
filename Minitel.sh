#!/bin/sh
## travailler sur la version locale dans ~ puis la copier dans /usr/local/bin/
## >> sudo cp Minitel.sh /usr/local/bin/
## 11/12/2020 d'après https://mars-hack-lab.fr/?p=282
## remplacé 4800 par 9600 car je crois que le Minitel supporte 9,6 Kbds

TTY=${1:-ttyUSB0}
BPS=9600

stty -F "/dev/$TTY" $BPS istrip cs7 parenb -parodd brkint ignpar icrnl \
ixon ixany opost onlcr cread hupcl isig icanon echo echoe echok;

## ajouté le 11/12/2020
## d'apres https://www.howtogeek.com/687970/how-to-run-a-linux-program-at-startup-with-systemd/

echo "minitel.service: ## Starting ##" | systemd-cat -p info

while [ -e "/dev/$TTY" ]; do
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "minitel.service: launching AGETTY timestamp ${TIMESTAMP}" | systemd-cat -p info
agetty -a pi -c -L -i -I "\033\143" $TTY $BPS minitel2-80
sleep 1
done
