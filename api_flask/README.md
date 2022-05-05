Afin d'utiliser l'environement virtuel de dev, merci de taper la commande suivante:

    source ./venv/bin/activate
Pour que le serveur puisse se lancer, l'application à besoin d'une variable d'environement
Merci de lancer le script situé dans ./settings.sh
Le script contient juste la commande:

    export FLASK_APP=main.py

Les utilisateurs de WINDOWS devront probablement rajouter cette variable vi l'environement graphique.

Pour lancer le serveur:

    flask run --reload

Pour voir la documentation merci de vous rendre à:

    http://localhost:5000/openapi.json
