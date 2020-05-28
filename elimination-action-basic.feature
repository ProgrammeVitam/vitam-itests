#language: fr

@Elimination
@EliminationAction
Fonctionnalité: Test workflow d'analyse de l'élimination

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Workflow d'action d'élimination avec seuil trop faible
    Etant donné les tests effectués sur le tenant 0

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/TEST_ELIMINATION.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#operations":["Operation-Id"]}}]},
      "$threshold": 1
    """
    Et je lance une élimination définitive avec pour date le 2050-01-01 qui se termine avec le statut KO




  Scénario: Workflow d'action d'élimination mono service producteur
    Etant donné les tests effectués sur le tenant 0

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/TEST_ELIMINATION.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#operations":["Operation-Id"]}}]},
      "$threshold": 6
    """
    Et je lance une élimination définitive avec pour date le 2018-01-01 qui se termine avec le statut WARNING

    # Vérification globale

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#opi":"Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 3

    Et je recherche les groupes d'objets
    Alors le nombre de résultat est 2
