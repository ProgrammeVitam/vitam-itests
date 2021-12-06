# language: fr

@Collect
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM
  Contexte: Un utilisateur ayant accès au module de collect désire initialiser une transaction

  Scénario: Initialisation d'une transaction de collecte de données
    Etant donné un utilisateur possédant le rôle ACCESS_COLLECT
    Quand j'initialise une transaction
    Alors le service de collecte me retourne le guuid de la transaction
