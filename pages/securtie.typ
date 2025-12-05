= Securiser son serveur

== Debian

Automatiser l'installation des mise à jour de sécurité : \
`sudo apt-get install unattended-upgrades apt-listchanges`

Valider par *yes* l'installation automatique des mises à jour : \
`sudo dpkg-reconfigure --priority=low unattended-upgrades`

== Simulation de charge du serveur

Installer *siege* : \
`sudo apt-get install siege`

Simuler *100 utilisateurs virtuels* pendant *1 minute* : \
`siege -c 100 -t 1M http://votre-serveur-nginx.com`