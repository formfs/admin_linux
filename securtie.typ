= Securiser son serveur

== Debian

Automatiser l'installation des mise à jour de sécurité : \
`sudo apt-get install unattended-upgrades apt-listchanges`

Valider par *yes* l'installation automatique des mises à jour : \
`sudo dpkg-reconfigure --priority=low unattended-upgrades`