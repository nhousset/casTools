# casTools
Ce projet regroupe un ensemble d'outis de monitoring pour SAS Viya 3.5

## Prérequis

Les outils python fonctionnent avec la version 3.

Pour les scripts exécutant du code, il est nécessaire de créer un fichier authinfo afin de permettre l’authentification, en mode batch, au serveur CAS.

Le format d'un fichier authinfo est basé sur la spécification du fichier .netrc qui est utilisé pour la connexion FTP. 
Vous devez spécifier explicitement un ID utilisateur et un mot de passe dans le fichier authinfo. 

Sous Linux, le fichier est nommé .authinfo. Le format de la ligne dans le fichier authinfo est le suivant. Les deux premières valeurs  sontt le hostname elt port de votre serveur CAS  Controller(5570). Vient ensuite la clé 'user' suivie de sa valeur (l'identifiant de l'utilisateur), puis la clé 'password' suivie de sa valeur (le mot de passe de l'utilisateur). Notez qu'il existe des règles de permission pour ce fichier. Sous linux, le fichier doit avoir des permissions de 600, seul l'utilisateur peut lire ou écrire le fichier.

Exemple de fichier authinfo :

```
host serveur.viya.com port 5570 username user01 password !s3cret
````

### Verifier le status de CAS

Ce script python permet de vérifier l’état du CAS Controller. Le programme python tente une connexion et affiche son statut en fonction de la réussite ou de l’échec de cette connexion. 

```
casup.sh viya.sas 5570 /opt/sas/.authinfo
```
