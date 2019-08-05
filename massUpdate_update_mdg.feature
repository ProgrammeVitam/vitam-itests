#language: fr

@updateMddGestion
Fonctionnalité: Modifier en masse des métadonnées de gestion d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip

## ajouter l'AU et son entrée au panier

  Scénario: Modifier le RuleId dans une même catégorie de règle
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_sameCategogyRuleId.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est WARNING

  Scénario: Modifier le RuleId dans une même catégorie de règle en changeant la StartDate
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_sameCategogyRuleIdStartDate.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est WARNING

  Scénario: Modifier le sort final de règles
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_finalActionRule.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est WARNING


