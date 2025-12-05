== SSH Connexion

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
