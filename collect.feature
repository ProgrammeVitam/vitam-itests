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