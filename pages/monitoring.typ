== Monitorer sa machine

*Liste* des répertoires qui prennent le plus de place :

`du -ch --max-depth=2 / 2>/dev/null | sort -rh | head -15`

Liste les *derniers* fichiers *crées* ou *modifiés* dans les dernieres 5 minutes :

`find / -mmin 5 > liste.txt`

Voir les *ports* ouverts sur son serveur :

`ss -tulpn`

Lister tous les *services* *actifs* :

`systemctl -t service`

Les options de *systemctl* pour un *service* comme *nginx* :\
- demarrer : `systemctl start nginx`
- arreter : `systemctl stop nginx`
- redemarrer : `systemctl restart nginx`
- status : `systemctl status nginx`
- activer au demarrage de la machine : `systemctl enable nginx`
- desactiver au demarrage de la machine : `systemctl disable nginx`

*Information* sur la machine :
`hostnamectl`

*journalctl* permet d'*afficher* les *logs* *systemes* (*syslog*).

Afficher les *logs* de sa machine en *live* :
`journalctl -f`

Afficher les *logs* de sa machine en *live* aujourd'hui :
`journalctl --since=today -f`

Afficher les *logs* de sa machine en *live* à une date précise :
`journalctl --since="2025-12-02 09:00:00" -f`

Afficher les *logs* de sa machine en *live* il y a une heure :
`journalctl --since="1 hour ago" -f`

Afficher les logs d'un *service* *nginx* en live :
`journalctl -u nginx -f`

Afficher les logs de *plusieurs* *service* *nginx* en live :
`journalctl -u nginx -u mysql -f`

Afficher les *logs* de sa machine en *live* avec les *ereurs* :
`journalctl -f -p err`

Afficher les 10 *denieres* *erreurs* dans les *logs* :
`journalctl -p err -n 10 --no-pager`

Afficher les *erreurs* avec une *couleur* en recherchant avec *grep* :
`journalctl  | grep --color "error"`

Combiner l'affichage des *erreurs* avec une *couleur* en recherchant avec *grep* :
`journalctl -f | grep --color -E "error|warning|critical"`

Coloriser les *logs* avec *ccze* : \
`sudo apt install ccze` \
`journalctl -f | ccze -A`

Exporter les *logs* au format *json* :
`journalctl -o json`

Afficher les *logs* sous diffenrente formes :
- Que le message : `journalctl -o cat`
- Tous les champs : `journalctl -o verbose`
- Format cours (par defaut) : `journalctl -o short`
- Format cours à la microseconde : `journalctl -o short-precise`

Lister les derniers boot :
`journalctl --list-boots`
`journalctl -u ssh.service --since "1 week ago" | grep -E "(shutdown|reboot)"`
`grep -E "(shutdown|reboot)" /var/log/auth.log`
