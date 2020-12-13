## lancé au démarrage par .bashrc quand on se loggue en tant que "pi" 
## et que le terminal est un minitel (commence par m1 ou m2)
cd /home/pi/src/Minitel
git pull ## remet à jour le dossier à partir du repo GITHUB
source afterbootstrap.sh ## et continue avec une version éventuellement mise à jour
