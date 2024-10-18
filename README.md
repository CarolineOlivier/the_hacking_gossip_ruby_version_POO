# The Gossip Project

Une application Ruby en architecture MVC qui permet de partager, consulter et supprimer des potins.

## Table des matières
1. [Présentation](#présentation)
2. [Installation](#installation)
3. [Utilisation](#utilisation)
4. [Architecture](#architecture)
5. [Fonctionnalités](#fonctionnalités)
6. [Contribuer](#contribuer)
7. [Licence](#licence)

## Présentation

The Gossip Project est un projet éducatif développé dans le cadre de la formation The Hacking Project. Il s'agit d'une application console qui permet de créer, afficher et supprimer des potins en utilisant une architecture MVC (Modèle-Vue-Contrôleur). Les potins sont stockés dans un fichier JSON.

**Installation**
# Clonez le dépôt :
   git clone https://github.com/votre_nom_utilisateur/the_gossip_project.git
   cd the_gossip_project

**Pour Installez les dépendances avec Bundler et générer le Gemfile.lock :**
# Exécuter la commande : 
bundle install


**Utilisation**
# Lancez l'application depuis le terminal :
 ruby app.rb

 **Architecture**
Le projet suit une architecture MVC avec les composants suivants :

- Router : Prend les entrées de l'utilisateur et route vers le Controller.
- Controller : Gère les actions (créer, afficher, supprimer un potin) et communique entre le Model et la View.
- View : Affiche les informations et recueille les entrées de l'utilisateur.
- Model (Gossip) : Représente un potin avec deux attributs (content, author) et interagit avec un fichier JSON.

**Arborescence des fichiers**
.
├── lib
│   ├── controller.rb
│   ├── gossip.rb
│   ├── router.rb
│   └── view.rb
├── db
│   └── gossip.json
├── app.rb
├── Gemfile
└── Gemfile.lock

**Fonctionnalités**
# options proposées  : 
- Créer un potin : Ajoute un nouveau potin avec un auteur et un contenu.
- Afficher les potins : Liste tous les potins existants.
- Supprimer un potin : Supprime un potin de la liste.

**Contribuer**
Les contributions sont les bienvenues ! Pour proposer des modifications :

# Forkez le dépôt.
Créez une branche pour votre fonctionnalité (git checkout -b ma_nouvelle_fonctionnalité).
Faites vos modifications et committez (git commit -am 'Ajout d'une nouvelle fonctionnalité').
Poussez la branche (git push origin ma_nouvelle_fonctionnalité).
Ouvrez une Pull Request.

**Licence**
Ce projet est sous licence MIT. 