= Securiser son serveur

== Debian

*Automatiser* l'installation des *mises à jour* de *sécurité* : \
`sudo apt-get install unattended-upgrades apt-listchanges`

Valider par *yes* l'installation *automatique* des *mises à jour* : \
`sudo dpkg-reconfigure --priority=low unattended-upgrades`

== Simulation de charge du serveur

Installer *siege* sur une machine *hôte* : \
`sudo apt-get install siege`

Simuler *200 utilisateurs virtuels* pendant *1 minute* vers le site web *cible* : \
`siege -c 200 -t 1M http://votre-serveur-nginx.com`
