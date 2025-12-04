#!/usr/bin/en bash

echo "========================="
echo "Generation d'une clef ssh"
echo "========================="

read -p "Nom de la clef ssh ? " clef_ssh
ssh-keygen -t ed25519 -N "" -f "$HOME/.ssh/$clef_ssh"

echo "===================================================="
echo "Ajout permission sur clef publique ..."
echo "===================================================="

chmod 644 "$HOME/.ssh/$clef_ssh.pub"

echo "===================================================="
echo "Ajout permission sur clef privé ..."
echo "===================================================="

chmod 600 "$HOME/.ssh/$clef_ssh"

ls -al $HOME/.ssh/
