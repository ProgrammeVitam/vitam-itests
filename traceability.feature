# language: fr

@Traceability
Fonctionnalité: Génération journal des opérations sécurisé
	Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
    
  Scénario: Sécurisation du journal d’opération OK
    Quand je génère un journal des opérations sécurisé
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OP_SECURISATION, OP_SECURISATION_TIMESTAMP, OP_SECURISATION_STORAGE sont OK
