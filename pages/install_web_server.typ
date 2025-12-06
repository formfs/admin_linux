= Installation d’un serveur web local
<installation-dun-serveur-web-local>



== LEMP : Linux Nginx MySQL/MariaDB PHP
<lemp-linux-nginx-mysqlmariadb-php>


== Installation de php
<installation-de-php>
#link("https://www.php.net/")[https:\/\/www.php.net]

 *PHP* (officiellement, ce sigle est un acronyme récursif pour *PHP Hypertext Preprocessor*) est un langage de scripts généraliste et Open Source, spécialement conçu pour le développement d'applications web. Il peut être intégré facilement au *HTML*. 

 *PHP* est principalement conçu pour servir de *langage* de *script* coté *serveur*, il peut :
 - collecter des données de formulaire
 - générer du contenu dynamique
 - gérer des cookies

#pagebreak()

Il y a deux domaines différents où *PHP* peut s'illustrer :

- Langage de *script* côté *serveur*. C'est l'utilisation la plus traditionnelle, et aussi le principal objet de *PHP*. Trois composants sont nécessaires pour l'exploiter : 
   - un analyseur *PHP* (CGI ou module serveur)
   - un *serveur* *web* 
   - un navigateur web
- Langage de programmation en *ligne de commande*. Un *script* *PHP* peut être *exécuté* en *ligne de commande*, sans l'aide du *serveur* web et d'un navigateur. Il suffit de disposer de l'exécutable *PHP*. Cette utilisation est idéale pour les scripts qui sont exécutés régulièrement avec un *cron* sous *Unix* ou *Linux* ou un *gestionnaire de tâches* (sous *Windows*). 


*FPM* (*FastCGI Process Manager*) est une version améliorée de *FastCGI* pour *PHP*, conçue pour gérer efficacement de lourdes charges de trafic. Il offre une gestion fine des *processus*, une configuration flexible et des outils avancés de *monitoring* et de *journalisation*, ce qui le rend particulièrement adapté aux environnements web hautes performances.

#pagebreak()

On installe #strong[php] : \
`apt install php php-cli php-fpm php-mysql`

On vérifie la version de #strong[php] qu’on vient d’installer : \
`php -v`


On verifie que le service *php-fpm* est bien lancé: \
`systemctl status php8.xxx-fpm`




== Installation du serveur web nginx
<installation-du-serveur-web-nginx>
#link("https://nginx.org/")

*Nginx* est un logiciel libre de serveur *Web* (ou *HTTP*) ainsi qu'un *proxy* *inverse* écrit par Igor Sysoev, dont le développement a débuté en 2002.

#pagebreak()

Installation : `apt-get install nginx`

On démarrage le serveur #strong[nginx] `systemctl start nginx`

On configure #strong[nginx] pour prendre en charge les fichiers
#strong[php] , éditer le fichier :
`nano /etc/nginx/sites-available/default`

Changer la ligne `try_files $uri $uri/ =404;` par
`try_files $uri $uri/ /index.php?$args;`



Ajouter :

```
location ~ \.php$ {
     include snippets/fastcgi-php.conf;
     fastcgi_pass unix:/run/php/php8.xxx-fpm.sock;
}
```



On test le fichier de configuration à savoir si il n’y a pas d’erreur
`nginx -t`

On relance le serveur #strong[nginx] `systemctl restart nginx`

Pour ne pas afficher les informations du serveur , editer


== LAMP : Linux Apache MySQL/MariaDB PHP
<lamp-linux-apache-mysqlmariadb-php>
#link("https://fr.wikipedia.org/wiki/LAMP")



== Installation du serveur web Apache
<installation-du-serveur-web-apache>
#link("https://httpd.apache.org/")[https:\/\/httpd.apache.org]

Le logiciel libre *Apache HTTP Server* (*Apache*) est un *serveur* *HTTP* créé et maintenu au sein de la fondation *Apache*.

#pagebreak()


Installation : `apt install apache2`


On crée le dossier du site web : \
`mkdir /var/wwww/wwww.monsuperbesiteweb.fr`


On crée une page #strong[index.html] dans ce dossier

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Mon site</title>
    </head>
    <body>
        <p>Bienvenue sur mon site.</p>
    </body>
</html>
```

#pagebreak()

Chaque site web qu’on héberge aura un hôte virtuel #link("https://httpd.apache.org/docs/current/fr/vhosts/examples.html")[VirtualHost]
\
avec son fichier de configuration `wwww.monsuperbesiteweb.fr.conf`

```bash
<VirtualHost 192.168.0.34:80>
     ServerName www.monsuperbesiteweb.fr.conf
     DocumentRoot /var/www/www.monsuperbesiteweb.fr
     DirectoryIndex index.html
     <Directory /var/www/www.monsuperbesiteweb.fr>
         Options -Indexes
     </Directory>
     ErrorDocument 404 /404.html
     ErrorLog ${APACHE_LOG_DIR}/error_www.monsuperbesiteweb.fr
     CustomLog ${APACHE_LOG_DIR}/access_www.monsuperbesiteweb.fr combined
</VirtualHost>
```



Activer le site `a2ensite wwww.monsuperbesiteweb.fr.conf`

Redémarrez le serveur `systemctl restart apache2`

Ajouter votre site au fichier `/etc/hosts` , dans Windows
`C:/windows/system32/drivers/etc/hosts`

```bash
192.168.0.34 www.monsuperbesiteweb.fr
```



== Installation d’un serveur de base de donnée mariadb/mysql
<installation-dun-serveur-de-base-de-donnée-mariadbmysql>
#link("https://mariadb.com/")[https:\/\/mariadb.com]


#link("https://mariadb.com/kb/en/documentation/")[MariaDB Server Documentation : https:\/\/mariadb.com/kb/en/documentation]

*MariaDB* est un système de gestion de base de données *relationnelle* édité sous licence *GPL*. Il s'agit d'un dérivé (*fork*) communautaire de *MySQL*.

#pagebreak()

Installation : `apt install mariadb-server`

On verifie si mariadb est bien lancé : `systemctl status mariadb`

Sinon le démarrarer : \

`service mariadb start` ou `systemctl start mariadb`

On vérifie la version de #strong[mariadb] : `mariadb --version`

Sécuriser #strong[mariadb] via le script : `mariadb-secure-installation`

Se connecter à #strong[mariadb] : `mariadb -u root -p`


Créer une base de donnée `CREATE database testdb;`

Créer un utilisateur avec tous les privilèges pour cette base de donnée
`CREATE USER 'testdbuser'@'localhost' IDENTIFIED BY 'UN_MOT_DE_PASSE';`

`GRANT ALL PRIVILEGES ON testdb.* TO 'testdbuser'@'localhost';`

`FLUSH PRIVILEGES;`

Sortir de #strong[mariadb] `exit;`



Sélectionnez une base de donnée `USE DataBaseName;`

Lister toutes les base de données `SHOW DATABASES;`

Lister toutes les tables `SHOW TABLES;`

Voir le #strong[schéma] d’une table `DESC DataBaseName.Table;`

Lister tous les users dans #strong[mariadb]
`SELECT user FROM mysql.user;`



== Tester des pages html,php
<tester-des-pages-htmlphp>
Donner des droits à l’utilisateur pour écrire dans le répertoire ou se
trouve les fichiers du serveur `chown -R $USER:$USER /var/www/html`

Créer une page de test #strong[php]
`echo "<?php phpinfo(); ?>" > /var/www/html/info.php`



Tester la connexion à la base de donnée : `testdb.php`

```php
<?php

try{
    $dbconn = new pdo( 'mysql:host=127.0.0.1;dbname=testdb',
                    'testdbuser',
                    'testdbuserModeDePasse',
                    [pdo::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
    die(json_encode(array('connexion db' => true)));
}
catch(PDOEXCEPTION $e){
    die(json_encode(['connexion db' => false, 'message' => 'unable to connect']));
}
?>
```



== Compression
<compression>
#strong[zip]

`zip -r dossier.zip dossier/`

#strong[unzip]

`unzip dossier.zip`

#strong[tar]

`tar -cvf backup.tar /home/user`

#strong[tar.gz]

`tar -cvzfp backup.tar.gz /home/user`




Backup d’une machine entière avec exclusion de dossier :

`tar -cvzfp backup.tgz --exclude=/proc --exclude=/lost+found  --exclude=/mnt --exclude=/media  --exclude=backup.tgz --exclude=/sys /`



#strong[Exclure des fichiers lors de la compression tar.gz]

`tar --exclude file.txt --exclude file.sh -cvzf backup.tar.gz`

#strong[Extraire tar.gz]

`tar -xvzf backup.tar.gz`

#strong[Lister le contenue d’un tar.gz]

`tar -ztvf backup.tar.gz`



#strong[Découper une archive tar.gz en plus petit morceaux]

`tar cvf - /home/user | split --bytes=200MB - backup.tar`

#strong[Tester si un fichier tar.gz n’est pas corrompu]

`gunzip -t backup.tar.gz`

#strong[Tester l’intégrité d’un fichier tar ou tar.gz]

`gunzip -c backup.tar.gz | tar t > /dev/null`

`tar -tvWF backup.tar`



== Sauvegarder une base de donnée mariadb avec /mariadb-dumb


`mariadb-dumb --user=user_name --password=user_password database_name > database_name.sql`

Avec compression :

`mariadb-dumb --user=user_name --password=user_password database_name | gzip > database_name.sql.gz`

Personnaliser son fichier de sauvegarde avec la date \(Jour Mois Année
Heure Minute Seconde) :

`mariadb-dumb --user=user_name --password=user_password database_name > database_name-$(date ++%d%m%Y%H%M%S).sql`


Sauvegarder plusieurs bases de données :

`mariadb-dumb --user=user_name --password=user_password --databases database_name_1 database_name_2 database_name_3   > database_names.sql`

Sauvegarder toutes les bases de données :

`mariadb-dumb --user=user_name --password=user_password --all-databases > database_name_complete.sql`



Sauvegarder toutes les bases de données dans des fichiers séparées à
l’aide d’une boucle for :

```bash
for database in $(mysql/mariadb --user=user_name --password=user_password -e 'show databases' -s --skip-column-names); do 
    mariadb-dumb $database > "$database.sql";
done
```

Restaurer une sauvegarde de base de donnée depuis un fichier sql :

`mysql/mariadb --user=user_name --password=user_password  < database_name.sql`



Restaurer une sauvegarde complète de base de donnée depuis un fichier
sql :

`mysql/mariadb --user=user_name --password=user_password  --one-database database_names < database_name_complete.sql`

Supprimer les sauvegardes datant de plus de 30 jours à l’aide de find :

`find /mes_sauvegardes -type f -name "*.sql" -mtime +30 -delete`



== Combinaison de commandes pour monitorer sa machine

Liste des répertoires qui prennent le plus de place :

`du -ch --max-depth=2 / 2>/dev/null | sort -rh | head -15`

Liste les derniers fichiers crées ou modifiés dans les dernieres 5
minutes :

`find / -mmin 5 > liste.txt`

Voir les ports ouverts sur son serveur :

`ss -tulpn`

#pagebreak()

#include "vagrant.typ"

#pagebreak()

#include "ufw.typ"

#pagebreak()

#include "securtie.typ"

= Ressources

== Sécurité informatique

- #link("https://secnumacademie.gouv.fr/")[SecNumAcadémie, la formation en ligne sur la sécurité informatique gratuite et ouverte à tous : https:\/\/secnumacademie.gouv.fr]

- #link("https://www.ssi.gouv.fr/administration/bonnes-pratiques/")[Les bonnes pratiques de sécurité informatique : https:\/\/www.ssi.gouv.fr/administration/bonnes-pratiques]


