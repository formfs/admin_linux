#!/bin/sh

echo "=========================================================="
echo "Supprimer les paquest d'un d'un installation antérieur ..."
echo "=========================================================="

sudo apt remove --purge -y $(dpkg --get-selections docker.io docker-compose docker-doc podman-docker containerd runc | cut -f1)

sleep 2s

echo "================================================"
echo "Ajout des clefs GPG key officieles de Docker ..."
echo "================================================"

sudo apt update
sudo apt upgrade -y
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

sleep 2s

echo "================================================="
echo "Ajout la source des depots de Docker dans apt ..."
echo "================================================="

sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sleep 2s

echo "============================================"
echo "Mise à jour des sources de depots de apt ..."
echo "============================================"

sudo apt update

sleep 2s

echo "=========================="
echo "Installation de docker ..."
echo "=========================="

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

sleep 2s

echo "=============================================="
echo "Verification  que docker est bien démarré ..."
echo "=============================================="

sudo systemctl status docker

sleep 2s

echo "============================================================"
echo "Posinstall : permettre de lancer docker sans etre root ! ..." 
echo "============================================================"

sudo usermod -aG docker $USER
newgrp docker

echo "============================================================================="
echo "Verification que docker fonctionne , lancement d'un container Hello world ..."
echo "docker run --rm hello-world"
echo "============================================================================="

docker run --rm hello-world