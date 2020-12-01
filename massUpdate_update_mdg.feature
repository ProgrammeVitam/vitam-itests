#language: fr

@MassUpdate
@updateMdgGestion
Fonctionnalité: Modifier en masse des métadonnées de gestion d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0

## ajouter l'AU et son entrée au panier

  @Light
  Scénario: Modifier le RuleId dans une même catégorie de règle
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_sameCategogyRuleId.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier le RuleId dans une même catégorie de règle en changeant la StartDate
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_sameCategogyRuleIdStartDate.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier le sort final de règles
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_FinalActionRule.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK

  Scénario: Modification complexe des règles de gestion
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

    Quand j'utilise le fichier de requête suivant data/queries/mass-update/complex_add_update_delete_rules.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_all_units.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/ExpectedUnitA_After_ComplexInsertUpdateDeleteRules.json

    Quand j'utilise le fichier de requête suivant data/queries/mass-update/complex_hold_rule_update.json
    Et je lance la mise à jour de masse des règles de gestion
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_all_units.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/ExpectedUnitA_After_ComplexHoldRuleUpdates.json
