# language: fr

@Referential
Fonctionnalité: Contrôle des durées dans fichier règle de gestion par rapport aux durées de référence paramétrées dans la configuration

  Scénario: Import des règles KO (la durée dépasse)
    Etant donné les tests effectués sur le tenant 2
    Quand je vérifie le fichier nommé data/rules/regle_test_duration.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400 		|
