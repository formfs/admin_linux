== SSH Connexion

*Secure Shell* (*SSH*) est un protocole de *communication* sécurisé. Le protocole de connexion impose un échange de *clés de chiffrement* en début de connexion. Par la suite, tous les segments TCP sont authentifiés et chiffrés. Il devient donc impossible d'utiliser un analyseur de paquets (sniffer) pour voir ce que fait l'utilisateur.

#pagebreak()

- Installer *ssh* si pas présent sur le *serveur* : \ 
*sudo apt install openssh-server*

- Sur le *serveur* vérifier le status de *ssh* : \ 
*systemctl status ssh*

- Tester *ssh* en local :
*ssh localhost*

- Sur la machine hôte (*Windows* ou autre) générer un couple de *clefs* *publiques* *privées* : \
*ssh-keygen -t ed25519 -C "mon\@email.fr"*

- Copie de la *clé* *publique* sur le *serveur* : \
*ssh-copy-id -i ~/.ssh/clef_public.pub user\@ip_serveur*

- Connexion *ssh* :
*ssh user\@ipserveur*
