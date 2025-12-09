= Docker
== La conténeurisation d'applications

#image("../media/docker_logo.png")

Site officiel : #link("https://www.docker.com/")

*Docker* est une plateforme permettant de lancer certaines applications dans des conteneurs logiciels.

Construit sur des capacités du *noyau* *Linux* , un *conteneur* *Docker*, à l’opposé de machines *virtuelles* traditionnelles, ne requiert aucun système d’exploitation séparé et n’en fournit aucun.

Il s’appuie plutôt sur les fonctionnalités du *noyau* *linux* et utilise l’*isolation* de *ressources* (comme le *processeur*, la *mémoire*, les *entrées et sorties* et les *connexions* réseaux).

*Docker* accède aux capacités de *virtualisation* du *noyau* *Linux*.

#link("https://fr.wikipedia.org/wiki/Docker_(logiciel)")[Source Wikipédia]

#image("../media/docker_insfrastructure.png")

#image("../media/docker_vs_virtual_machine.png")

- #strong[Docker] est rapide en comparant à un machine
  #strong[virtuelle]

- #strong[Docker] fonctionne sur plusieurs plateformes

- Les #strong[containers] peuvent être construit et détruit plus vite
  qu’une machine #strong[virtuelle]

- Une fois votre #strong[Docker] configuré vous n’avez pas à réinstaller
  vos dépendances manuellement

- Vos #strong[environnement de développement] sont isolés les un des
  autres

- #strong[Docker] facilite le déploiement d’applications

#pagebreak()

#link("https://docs.docker.com/engine/install/debian/#install-using-the-repository")[Installer docker dans la distribution Debian]

Installer des paquets nécéssaires

#v(0.5em)
```
sudo apt-get install ca-certificates curl gnupg lsb-release
```
#v(0.5em)

Ajouter les clefs
#link("https://fr.wikipedia.org/wiki/GNU_Privacy_Guard")[GPG] offcielles
de #strong[Docker]

#v(0.5em)
```
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
#v(0.5em)

Ajouter le dépôt #strong[Docker] dans `/etc/apt/sources.list`

#v(0.5em)
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
```
#v(0.5em)

#pagebreak()

On met à jour les sources logiciels et on installe #strong[Docker]

#v(0.5em)
```
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```
#v(0.5em)

Permettre à l’utilisateur de lancer #strong[Docker] 

Si il n'est pas déjà installé , le verifier : `cat /etc/group`

Sinon on ajoute un groupe #strong[docker]

#v(0.5em)
```
sudo groupadd docker
```
#v(0.5em)

On ajoute l’utilisateur au groupe #strong[docker]

#v(0.5em)
```
sudo usermod -aG docker $USER
```
#v(0.5em)

On se deconnecte `exit` et même on redemarre sa machine `sudo reboot`

#image("../media/architecture.svg")

On lance une #strong[image] de test

#v(0.5em)
```
docker run hello-world
```
#v(0.5em)

Cette commande télécharge une #strong[image] de test et l’exécute
dans un *conteneur*. Lorsque le *conteneur* s’*exécute*, il *affiche* un message et *quitte*. \
#link("https://docs.docker.com/get-started/overview/")[Source Docker]

= Docker Conteneur
== Container

#emph[Un grand avantage de #strong[Docker] est la possibilité de
modéliser chaque #strong[conteneur] sous la forme d’une #strong[image]
que l’on peut stocker localement ou sur le #strong[Docker Hub];, endroit
public où de nombreuses images sont publiées et mises à jour
régulièrement.]
#link("https://fr.wikipedia.org/wiki/Docker_(logiciel)#Histoire")[Wikipédia]

Registre de #strong[conteneur] #link("https://dockerhub.com")[dockerhub]

#emph[L’objectif d’un #strong[conteneur] est le même que pour un serveur
dédié virtuel : héberger des services sur un même serveur physique tout
en les isolant les uns des autres. Un conteneur est cependant moins figé
qu’une machine virtuelle en matière de taille de disque et de ressources
allouées.]
#link("https://fr.wikipedia.org/wiki/Docker_(logiciel)#La_notion_de_conteneur")[Wikipédia]

Un #strong[conteneur] est constitué de différentes couches

#image("../media/docker_container_couches.png")

#pagebreak()

- Application
- Personnalisation \(Customization)
- Base OS\(Linux)

= Docker CLI
== Commande cli docker

#link("https://docs.docker.com/get-started/docker_cheatsheet.pdf")[Docker cheatsheet]

Démarrer le démon #strong[Docker] `docker -d`

Information sur la version de #strong[Docker] installé `docker version`

Se connecter à registre #strong[Docker] `docker login`

Obtenir de l’aide sur #strong[Docker];. `docker --help`

On peut également utiliser #strong[–help] sur toutes les sous-commandes

Affiche des informations sur l’ensemble du système `docker info`

Construire une image à partir d’un fichier #strong[Docker]
`docker build -t <nom_image>`

Construire une image à partir d’un #strong[Dockerfile] sans le cache
`docker build -t <nom_image> . -no-cache`

Liste des images locales `docker images`

Supprimer une image `docker rmi <nom_image>`

Supprimez toutes les images inutilisées `docker image prune`

#pagebreak()

Supprimez toutes les #strong[images,conteneurs,volumes,reseaux]
`docker system prune -a`

Connectez-vous à #strong[Docker Hub]
`docker login -u <nom d’utilisateur>`

Publier une image sur #strong[Docker Hub]
`docker push <nom_d’utilisateur>/<nom_image>`

Recherche d’une image dans le #strong[Docker Hub]
`docker search <nom_image>`

Extraire une image d’un #strong[Docker Hub] `docker pull <nom_image>`

Créer et exécuter un #strong[conteneur] à partir d’une image, avec un
nom personnalisé : `docker run --name <nom_du_conteneur> <nom_image>`

Exécuter un #strong[conteneur] avec et publier le ou les ports d’un
#strong[conteneur] sur l’hôte.
`docker run -p <host_port>:<container_port> <nom_image>`

Exécuter un #strong[conteneur] en arrière-plan
`docker run -d <nom_image>`

Démarrer ou arrêter un #strong[conteneur] existant :
`docker start|stop <nom_du_conteneur> (ou <identifiant_du_conteneur>)`

Tuer un #strong[conteneur] :
`docker kill <nom_du_conteneur> (ou <identifiant_du_conteneur>)`

Supprimez un #strong[conteneur] arrêté : `docker rm <nom_du_conteneur>`

Ouvrez un shell à l’intérieur d’un #strong[conteneur] en cours
d’exécution : `docker exec -it <nom_du_conteneur> sh(bash)`

Récupérer et suivre les journaux d’un #strong[conteneur] :
`docker logs -f <nom_du_conteneur>`

Pour inspecter un #strong[conteneur] en cours d’exécution :
`docker inspecter <nom_du_conteneur> (ou <identifiant_du_conteneur>)`

Pour lister les #strong[conteneurs] en cours d’exécution : `docker ps`

Lister tous les #strong[conteneurs] docker \(en cours d’exécution et
arrêtés) : `docker ps --all`

Afficher les statistiques d’utilisation des ressources
`docker container stats`

Lancer un #strong[conteneur] #strong[nginx]

`docker run -d -p 8080:80 --name monserveur nginx`

Un #strong[conteneur] est ephemere , on ne peut rien y stocker , pour
avoir ses données persissantes on crée des #strong[volumes] qu’on
attache à son #strong[conteneur];.

Ses #strong[volumes] seront attachés\(montés) à des repertoires.

Créer un #strong[volume] `docker create volume <nom du volume>`

Lister tous les #strong[volumes] `docker volume ls`

Information sur un #strong[volume]
`docker volume inspect <nom du volume>`

Supprimer un #strong[volume] `docker volume rm <nom du volume>`

Supprimer tous les #strong[volumes] non montés `docker volume prune`

= YAML
== Yaml format de présentation de données

#link("https://fr.wikipedia.org/wiki/YAML")[YAML] : Ain’t Markup
Language

*YAML* est un format de représentation de données.
#link("https://fr.wikipedia.org/wiki/YAML#Caract%C3%A9ristiques")[Wikipédia]

#link("http://www.yamllint.com/")[YAML Lint]

= Docker compose
== Docker compose

#link("https://docs.docker.com/compose/")[Docker Compose]
*Docker Compose* est un logiciel pour définir et exécuter des
applications à partir de *multiples* *conteneurs*. Il est basé sur un
fichier #strong[YAML] qui permet de définir les *services* et les
paramètres de leurs créations et ainsi de les démarrer par une commande
unique.]
#link("https://fr.wikipedia.org/wiki/Docker_(logiciel)#Outils_associ%C3%A9s")[Source Wikipédia]

Il existe deux implémentations de #strong[Docker Compose] :

- L’implémentation plus ancienne basée sur Python
  \(#strong[docker-compose];)

- La nouvelle implémentation basée sur #strong[Go] utilisant un plugin
  \(#strong[docker compose];)

#link("https://compose-spec.io/")[Compose Specification]

#link("https://docs.docker.com/compose/install/")[Documentation pour l’installation de Docker Compose]

== Docker Compose CLI
<_docker_compose_cli>
Construire des images `docker compose build`

Démarrer des #strong[conteneurs] `docker compose start`

Arreter des #strong[conteneurs] `docker compose stop`

Construire et démarrer des #strong[conteneurs] `docker compose up -d`

Lister tous les #strong[conteneurs] actifs `docker compose ps`

Supprimer des #strong[conteneurs] `docker compose rm`

Arreter et supprimer des #strong[conteneurs] `docker compose down`

Afficher les logs `docker compose logs`

Lancer une commnade dans un #strong[conteneur]
`docker compose exec <conteneur> bash`

Lancer une instance en tant que projet
`docker compose --project-name test1 up -d`
`docker compose -p test2 up -d`

Lister tous les projets actifs `docker compose ls`
