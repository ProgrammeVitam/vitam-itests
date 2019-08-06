#language: fr

@deleteMddGestion
Fonctionnalité: supprimer en masse des métadonnées de gestion d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip

  Scénario: Supprimer une catégorie de règle - RuleId
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_rule_RuleId.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est WARNING

  Scénario: Supprimer la StartDate d'une catégorie de règle
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_startDateCategoryRule.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK