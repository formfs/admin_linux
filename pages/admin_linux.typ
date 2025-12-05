= Administration Linux

== Linux ou GNU/LINUX

#figure(
  image("../media/Linux_Logo_in_Linux_Libertine_Font.svg.png", width: 40%),
  caption: [
    *Tux* le manchot mascotte officielle du *noyau* *Linux*
  ],
)

== Système d'exploitation Open Source

https://fr.wikipedia.org/wiki/Linux_ou_GNU/Linux 

*OS* : Operating System

Crée en *1991* par *Linus Torvalds*

Création en tant que passe-temps !


Basé sur l'*OS MINIX*

Lui même basé sur les principes et la conception d'*Unix*


== Premier système d’exploitation au monde sur serveurs
<premier-système-dexploitation-au-monde-sur-serveurs>
Seul *OS* à être utilisé sur les *500* *Super Ordinateurs* les plus rapides au monde

#link("https://www.top500.org/statistics/sublist/")



== Linux est distribué sous licence GNU GPL
<linux-est-distribué-sous-licence-gnu-gpl>
#link("https://fr.wikipedia.org/wiki/GNU_GPL")

- Exécuter
- Étudier
- Partager
- Modifier



== Unix / Windows
<unix-windows>
- Propriétaire
- Verrouillé
- Non modifiable


#image("../media/unix_history.svg")

== Fontionnement d'une machine sous Linux

#image("../media/linux_kernel_ubiquity.svg.png")

== Distribution Linux

#emph[Une distribution Linux, appelée aussi distribution GNU/Linux
lorsqu’elle contient les logiciels du projet GNU, est un ensemble
cohérent de logiciels, la plupart étant des logiciels libres, assemblés
autour du noyau Linux, et formant un système d’exploitation pleinement
opérationnel.] 
#link("https://fr.wikipedia.org/wiki/Distribution_Linux")[Source Wikipédia]

#link("https://fr.wikipedia.org/wiki/Liste_des_distributions_GNU/Linux")[Liste des distributions GNU/Linux]

#strong[Distributions généralistes] : Debian, Ubuntu, Mageia, Fedora,
Slackware, OpenSUSE, ArchLinux, Gentoo…

Les distributions orientées exclusivement vers l’*entreprise* avec un contrat de *support* annuel \(à base de souscription par machine) par exemple *Red Hat Entreprise Linux*, *Ubuntu Long Term Support(LTS)* et *SUSE Linux Enterprise.*

#link("https://distrowatch.com/?language=FR")[Réferencement de toutes les distributions Unix/Linux : Distrowatch]


== Répertoires d'un systeme GNU/Linux

#link("https://doc.ubuntu-fr.org/arborescence")[Arborescence d’un système GNU/Linux]

Manuel Filesystem Hierarchy

*man hier*

---

- #strong[/] : Racine du système
- #strong[/bin] \(binaries) : Exécutables essentiels au système,
  utilisables par tous les utilisateurs \(ls,mkdir,touch,cp,…)
- #strong[/boot] \(bootstrap : initialisation) : fichiers permettant à
  Linux de démarrer \(noyau,…)
- #strong[/dev] \(device) : Fichiers spéciaux des périphériques
  \(disques durs, écrans, partitions, webcam,…)
- #strong[/etc] \(editing text config) : Fichiers de configuration au
  format textuel de plusieurs programmes et services du système
  \(passwd, fstab,…)



- #strong[/home] : Répertoire personnel des utilisateurs
- #strong[/lib] \(librairies : bibliothèques) : Bibliothèques partagées
  essentielles et modules du noyau
- #strong[/lib64] : idem /lib mais pour les 64bits \(parfois, on
  trouvera lib et lib32. Dans ce cas, lib \= 64bits et lib32 \= 32bits)
- #strong[/media] : Contient les points de montages pour les médias
  amovibles
- #strong[/mnt] \(mount : montage) : Point de montage pour monter
  temporairement un système de fichiers



- #strong[/opt] \(optional) : Emplacement pour des applications
  installées hors gestionnaire de paquets \(logiciels
  #strong[opt];ionnels)
- #strong[/proc] \(process) : Répertoire virtuel ne prenant aucune place
  sur le disque, pour les informations système \(noyau, processus)
- #strong[/root] \(racine) : Répertoire personnel du super utilisateur



- #strong[/run] \(runtime system : exécution système) : Informations
  relatives au système depuis son dernier démarrage \(ex : utilisateurs
  actifs, services en cours d’exécution,…)
- #strong[/sbin] \(super binaries) : Programmes système essentiels
  utilisables par l’admin uniquement
- #strong[/srv] \(services) : N’est pas présent dans toutes les
  distributions. C’est un répertoire de données pour divers services
  \(stockage des documents de comptes FTP, ou pages de sites web)
- #strong[/sys] : Répertoire virtuel ne prenant aucune place sur le
  disque. Contient des informations entre le système et ses composants
  matériels
- #strong[/tmp] \(temporary) : Fichiers temporaires des applications



- #strong[/usr] \(Unix System Ressources) : Programmes installés
  \(#strong[/usr/bin];) avec leur librairies \(#strong[/usr/lib] ou
  #strong[/usr/lib64];) tels que firefox, libreoffice, … quelques
  programmes réservés à l’admin système \(#strong[/usr/sbin];) et les
  fichiers de code source \(#strong[/usr/src];).
  - On y retrouve #strong[/usr/share] avec les éléments partagés
    indépendants de l’architecture \(documentation, icônes, …).
  - Dans #strong[/usr/local] on pourra installer les programmes compilés
    manuellement sur le système.
- #strong[/var] \(variable) : Données variables \(fichiers de log dans
  #strong[/var/log];) mais parfois les bases de données
  \(#strong[/var/lib/mysql];) et les pages de site web
  \(#strong[/var/www/html];)



== Virtualbox
<virtualbox>
#link("https://www.virtualbox.org/")[https:\/\/www.virtualbox.org]

#image("../media/vbox_logo2_gradient.png")



== Debian
<debian>
#link("https://www.debian.org/releases/index.fr.html")

#box(width: 81.0pt, image("../media/openlogo.svg"))

#include "ssh.typ"

== Commande pour gérer une machine à base de Debian
<commande-pour-gérer-une-machine-à-base-de-debian>

La liste des dépôts des logiciels se trouve dans #strong[/etc/apt/source.list] \
ainsi que #strong[/etc/apt/sources.list.d/fichier_source.list]

- Met à jour la liste des logiciels disponibles #strong[apt update]
- Mise à jour de la distribution #strong[apt upgrade]
- Simuler une mise à jour #strong[apt --simulate upgrade]

---

Installer des services,...

#strong[tasksel]

---

- Installer un logiciel avec ses dépendances #strong[apt install logiciel]
- Dés-installer un logiciel avec ses dépendances #strong[apt remove logiciel]
- Dés-installation complète d’un logiciel avec ses fichiers de configuration #strong[apt remove --purge logiciel]
- Rechercher un logiciel #strong[apt search logiciel]
- Information sur un logiciel installé #strong[apt-cache policy logiciel]

Recherche de logiciel sur le site web : #link("https://packages.debian.org/fr/")[Debian packages]

== Réseaux

Le fichier #strong[/etc/hostname] contient le nom de la machine

Le fichier #strong[/etc/hosts] permet de lier une adresse ip à un nom hôte
local.

Le fichier #strong[/etc/network/interfaces] permet de mettre une ip statique à la place de *dhcp*


== For fun
<for-fun>
- *apt install cowsay*
- *apt install cmatrix*
- *apt install sl*
- *apt install toilet*
- *apt install figlet*
- *apt install lolcat*



== Commande d’informations sur un programme
<commande-dinformations-sur-un-programme>
- *man programme* : Lire le manuel d’utilisation d’une commande
- *whereis programme* : Permet de rechercher les fichiers exécutables,
  les sources et les pages de manuel d’une commande \
  (*whereis ls* renvoie *ls: /usr/bin/ls /usr/share/man/man1/ls.1.gz*)
- *which programme* : Permet de savoir quel est le fichier exécuté \ 
  (*which python* renvoie *\/usr/bin/python*)
- *whatis programme* : Permet de savoir rapidement à quoi sert une
  commande \ 
  (*whatis mkdir* renvoie *pwd (1) - print name of current/working directory*)



== Commandes shell
<commandes-shell>
Une commande #strong[shell] est une chaîne de caractères en minuscules
qui peut être invoquée au travers d’une *invite de commande* ou d’un
*script*. Des *options* et des *arguments* peuvent la compléter. Ceux-ci sont
généralement appelés *paramètres* de la commande.



== Commande sur le système de fichier
<commande-sur-le-système-de-fichier>
- *pwd* : Affiche le nom du répertoire courant
- *ls* : Lister les fichiers et dossiers présents dans un répertoire \
- *cd* : Se déplacer dans un autre répertoire
- *df* : Indiquer l’espace occupé par les systèmes de fichiers
- *du* : Évaluer l’espace disque occupé par des fichiers

---

- *wc* : Compte le nombre de lignes, mots et caractères contenus dans un
  fichier
- *cat* : Concaténer des fichiers et les afficher sur la sortie standard
- *file* : Déterminer le type d’un fichier
- *stat* : Informations détaillées sur un fichier
- *free* : Connaître l’état de la mémoire du serveur
- *top ou htop* : Voir les processus en cours

---

- *cp* : Copier
- *mv* : Déplacer ou renommer
- *rm* : Suppression
- *mkdir* : Création de répertoire
- *rmdir* : Suppression de répertoire
- *ln* : Créer des liens physiques ou symboliques
- *find* : Rechercher des fichiers
- *grep* : Faire des recherches plein texte de chaînes de caractères


---

- *nl* : Affichage du contenu d’un fichier avec les numéros de lignes
- *head* : Affichage par défaut des 10 premières lignes d’un fichier
- *tail* : Affichage par défaut des 10 dernières lignes d’un fichier



== Information sur sa machine
<information-sur-sa-machine>
*last* : Afficher les #strong[dernières connexions] à votre machine

*lastlog2* :  Afficher les #strong[dernières connexions] de chaque
#strong[utilisateur] à votre machine

Liste des #strong[ports] ouvert sur votre machine *apt install nmap* \ 
*nmap localhost*



== Commande diverses
<commande-diverses>
*su* : sans préciser un utilisateur , \
*su* permet d’exécuter des commandes en mode *root* mais sans charger les variables d’environnement à la différence de *su -*

*useradd* : créer un nouvel utilisateur , pas de création d’un dossier
pour cet utilisateur dans *\/home* , pas de création de mot de
passe

*adduser* : à la différence de *useradd* un dossier dans
*\/home* est crée ainsi qu’un mot de passe

*deluser --remove-all-files* : supprimer un utilisateur avec tous ses
fichiers et répertoires



== Bash
<bash>

#link("https://fr.wikipedia.org/wiki/Bourne-Again_shell")[BASH]


*Bash* \(acronyme de Bourne-Again shell) est un interpréteur en
ligne de commande de type script. C’est le #link("https://fr.wikipedia.org/wiki/Shell_Unix")[shell] Unix du projet #link("https://fr.wikipedia.org/wiki/GNU")[GNU];.

Le terme #strong[shell] désigne un logiciel fournissant une interface à
l’utilisateur pour des composants d’un ensemble informatique .Il est
plus généralement employé pour désigner un interpréteur de lignes de
commandes pouvant accéder aux services et interagir avec le noyau d’un
système d’exploitation. Dans le cas de #strong[debian];, un
#strong[shell] interagit avec le noyau #strong[Linux];.



== Les fichiers de configuration BASH
- *\~/.bashrc* : Fichier permettant la configuration lors du lancement du programme bash
- *\~/.bash_aliases* : Fichier contenant des #strong[alias]
  \(substitutions abrégées de commandes à taper dans la console)
- *\~/.bash_history* : Historique des commandes tapés en ligne de
  commande , voir ce fichier avec *history*
- *\~/.profile* : Ce fichier n’est lu que si #strong[\~/.bash\_profile]
  ou #strong[\~/.bash\_login] n’existe pas. il permet de prendre en
  compte de nouveau chemin pour la variable d’environnement *PATH*.


== Piping

Ce qu’une commande lit au clavier peut être dirigé vers un fichier. Le
flux sur lequel une commande lit est nommé le fichier standard d’entrée
\(#strong[stdin];).

Ce fichier standard d’entrée peut lui-aussi être dirigée à l’aide du
méta-caractère *<*.

Ainsi, la commande *wc < un-fichier* fait comme si le contenu du fichier
#strong[un-fichier] était tapé sur le clavier alors que la commande
#strong[wc] \(sans argument) a été invoquée.

Dans le cas de la commande #strong[wc];, faire *wc un-fichier* ou
*wc < un-fichier* est totalement équivalent.

*cat mon-fichier* et *cat < mon-fichier* auront exactement le même
comportement.

On ne peut diriger l’entrée standard \(sortie standard) que de commandes
qui y lisent \(écrivent) des données.

Par exemple cela n’a pas de sens de diriger l’entrée de #strong[ls]
puisque #strong[ls] ne lit jamais de données sur son entrée standard.



On peut diriger la sortie standard d’une commande vers l’entrée standard
d’une autre *ls | wc*

Cette opération \(connecter la sortie d’une commande à l’entrée d’une
autre) se nomme un #strong[pipeline];.

Exécutions #strong[simultanées] de commandes
*mkdir dossierA & touch fichierB.txt & ... & ...*

Exécutions #strong[successives] de commandes *ls ; df ; ... ; ...*

Enchaînements #strong[conditionnels] de commandes
*ls && df && ... && ...*

== Gestion des droits d’accès 
#link("https://doc.ubuntu-fr.org/permissions")

#link("https://en.wikipedia.org/wiki/File-system_permissions")[File-system permissions : https:\/\/en.wikipedia.org/wiki/File-system\_permissions]


Chaque ﬁchier du système est associé à des droits d’accès. Ceux-ci sont
affichés par la commande #strong[ls];.

Ces droits d’accès sont résumés en 10 caractères de la forme suivante :

```bash
u (user) , g (group) , o(other)

type u_read u_write u_exec g_read g_write g_exec o_read o_write o_exec
```

On gère les droits sur les fichiers avec la commande #strong[chmod]

#include "install_web_server.typ"
