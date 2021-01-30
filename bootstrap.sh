## lancé au démarrage par .bashrc quand on se loggue en tant que "pi" 
## et que le terminal est un minitel (commence par m1 ou m2)
echo "debut de $0"
cd /home/pi/Minitel
git pull ## remet à jour le dossier à partir du repo GITHUB
echo "appel de afterboostrap.sh"
afterbootstrap.sh ## et continue avec une version éventuellement mise à jour
