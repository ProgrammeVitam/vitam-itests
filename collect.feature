# language: fr

@Collect
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Scénario: Test 1 Initialisation d'un projet de collecte de données
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et je recherche le projet
    Et je met a jour le projet avec le nom updateName
    Et je supprime le projet
    Alors le statut de la reponse est OK


  Scénario: Test 2 Initialisation d'une transaction de collecte de données
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et je recherche le projet
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction 
    Et j'utilise le fichier json suivant data/queries/collect/upload_au_collect.json
    Et je crée une au
    Et je recherche l'au par rapport à son titre
    Et j'utilise le fichier json suivant data/queries/collect/upload_got_collect.json
    Et je crée un GOT
    Et j'upload le fichier suivant data/queries/collect/plan-barbusse.txt
    Et je clôture et je constate son statut READY
    Et j'envoie le SIP et je constate son statut SENT


  Scénario: Test 3 Envoie une arborescence bureautique et purge du projet
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et je modifie les métadonnées du projet 






