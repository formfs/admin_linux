= Vagrant

== Création de VMs

*Vagrant* est un logiciel anciennement libre et open-source pour la *création* et la *configuration* des environnements de développement virtuels.

```bash
vagrant init [nom-de-boîte]
 Initialise un nouvel environnement Vagrant en créant un Vagrantfile

vagrant up
 Démarre et provisionne l'environnement Vagrant

vagrant halt
 Arrête l'environnement Vagrant en cours d'exécution

vagrant reload
 Redémarre l'environnement Vagrant

vagrant destroy
 Détruit l'environnement Vagrant

vagrant ssh
 Se connecte à l'environnement Vagrant via SSH

vagrant status
 Affiche le statut de l'environnement Vagrant
```

== Configuration

```bash
Vagrantfile
 Le fichier de configuration pour un environnement Vagrant

configvmbox = "nom-de-boîte"
 Spécifie la boîte de base pour l'environnement Vagrant

configvmnetwork "private_network", ip: "1921683310"
 Configure un réseau privé pour l'environnement Vagrant

configvmsynced_folder "src/", "/srv/website"
 Configure un dossier synchronisé entre l'hôte et l'environnement Vagrant

configvmprovider "virtualbox" do |vb|
 vbmemory = "1024"
 vbcpus = 2
end
 Configure les paramètres spécifiques au fournisseur pour l'environnement Vagrant
```

== Dépannage

```bash
vagrant global-status
 Liste tous les environnements Vagrant gérés par l'utilisateur actuel

vagrant global-status --prune
 Supprime les entrées du statut global qui ne sont plus valides

vagrant box list
 Liste toutes les boîtes Vagrant disponibles

vagrant box remove [nom-de-boîte]
 Supprime une boîte Vagrant
```