# language: fr

@Traceability
Fonctionnalité: Génération journal des opérations sécurisé
	Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Préparation traçabilité (test exécuté plus tard dans le fichier traceability.feature nécessitant des données de plus de 5 minutes)

    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
