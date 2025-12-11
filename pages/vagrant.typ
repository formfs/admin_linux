= Vagrant

== Création de VMs

*Vagrant* est un logiciel anciennement libre et open-source pour la *création* et la *configuration* des environnements de développement *virtuels*. \
*Vagrant* peut utiliser des *hyperviseurs* tel que *Virtualbox* , *VMWare*  , *Hyper-V* , *KVM*.

== Commandes de Base

Assurez-vous de travailler dans un répertoire de projet contenant un *Vagrantfile*, pas dans le répertoire racine.

Initialiser un nouvel environnement *Vagrant* en créant un *Vagrantfile*
`vagrant init [nom-de-boîte]`

Démarrer et provisionner l'environnement *Vagrant*
`vagrant up`

Arrêter l'environnement *Vagrant* en cours d'exécution
`vagrant halt`

Redémarrer l'environnement *Vagrant*
`vagrant reload`

Détruire l'environnement *Vagrant*
`vagrant destroy`

Se connecter à l'environnement *Vagrant* via *SSH*
`vagrant ssh`

Afficher le statut de l'environnement *Vagrant*
`vagrant status`

== Configuration

Le fichier de configuration pour un environnement *Vagrant*
`Vagrantfile`

Spécifie la boîte de base pour l'environnement *Vagrant*
`config.vm.box = "nom-de-boîte"`

Configure un réseau privé pour l'environnement *Vagrant*
`config.vm.network "private_network", ip: "1921683310"`

Configure un dossier synchronisé entre l'hôte et l'environnement *Vagrant*
`config.vm.synced_folder "src/", "/srv/website"`

Configure les paramètres spécifiques au fournisseur pour l'environnement *Vagrant* \
```bash
config.vm.provider "virtualbox" do |vb| #vb est un alias 
vb.memory = "1024"
vb.cpus = 2
end
``` \

== Dépannage

Liste tous les environnements *Vagrant* gérés par l'utilisateur actuel
`vagrant global-status`

Supprime les entrées du statut global qui ne sont plus valides
`vagrant global-status --prune`

Liste toutes les boîtes *Vagrant* disponibles
`vagrant box list`

Supprime une boîte *Vagrant*
`vagrant box remove [nom-de-boîte]`

== Résolution de Problèmes Avancés

`vagrant --debug`
L'exécution de `vagrant --debug` seul ne fournira pas de sortie utile. Vous devez spécifier une commande, comme `vagrant up --debug`, pour obtenir des informations de débogage détaillées.
