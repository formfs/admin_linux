= Parefeu (Firewall)

== UFW (UncomplicatedFirewall)

https://help.ubuntu.com/community/UFW

Le noyau *Linux* fournit un système de filtrage de paquets appelé *netfilter*, et l'interface traditionnelle pour manipuler *netfilter* est la suite de commandes *iptables*. *iptables* offre une solution de *pare-feu* complète, à la fois hautement configurable et très flexible.

- Activer le *pare-feu* : `sudo ufw enable`
- Désactiver le *pare-feu* : `sudo ufw disable`
- Afficher le *statut* (actif/inactif) : `sudo ufw status`
- Définir la politique par défaut pour bloquer tout trafic entrant (*Recommandé*) : 
  - `sudo ufw default deny incoming`
  - `sudo ufw default allow outgoing`
- Ouvrir un *port* spécifique : `sudo ufw allow 80` (*HTTP*)
- Ouvre un port pour un protocole spécifique : `sudo ufw allow 443/tcp` (*HTTPS*)
- Ouvre le port d'un service : `sudo ufw allow ssh` 
- Bloque le trafic sur un port spécifique : `sudo ufw deny 25` (*SMTP*)
- *ufw* a la possibilité de refuser les connexions à partir d'une adresse IP qui a tenté d'initier 6 connexions ou plus au cours des 30 dernières secondes : `sudo ufw limit ssh`