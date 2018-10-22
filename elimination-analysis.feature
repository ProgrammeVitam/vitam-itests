#language: fr

@DslOperatorIn
Fonctionnalité: Test workflow d'analyse de l'élimination

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Workflow d'analyse d'élimination multi-services producteurs
    Etant donné les tests effectués sur le tenant 0

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/EliminationAnalysis-SIP-Service comptable.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/EliminationAnalysis-SIP-Service Prévision et Plannification.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/EliminationAnalysis-SIP-Service_Financier.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#operations":["Operation-Id"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2018-01-01 qui se termine avec le statut OK


    # Vérification globale

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 4


    # Vérification unité Facture de l'exercice 2009 (élimination)

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}, {"$eq": {"Title": "Facture de l'exercice 2009 (élimination)"}}]}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques

    Alors les metadonnées sont
      | #elimination.0.GlobalStatus                                                          | CONFLICT                               |
      | #elimination.0.DestroyableOriginatingAgencies                                        | ["FRAN_NP_050634_elim"]                |
      | #elimination.0.NonDestroyableOriginatingAgencies                                     | ["FRAN_NP_051587_elim"]                |
      | #elimination.0.ExtendedInfo                                                          | [{"ExtendedInfoType":"KEEP_ACCESS_SP"},{"ExtendedInfoType":"ACCESS_LINK_INCONSISTENCY","ExtendedInfoDetails":{"ParentUnitId":"{{unit:Factures (élimination)}}","DestroyableOriginatingAgencies":["FRAN_NP_050634_elim"],"NonDestroyableOriginatingAgencies":["FRAN_NP_051587_elim"]}}]                |


    # Vérification unité Factures (élimination)

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}, {"$eq": {"Title": "Factures (élimination)"}}]}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques

    Alors les metadonnées sont
      | #elimination.0.GlobalStatus                                                          | CONFLICT                               |
      | #elimination.0.DestroyableOriginatingAgencies                                        | ["FRAN_NP_050634_elim"]                |
      | #elimination.0.NonDestroyableOriginatingAgencies                                     | ["FRAN_NP_051587_elim"]                |
      | #elimination.0.ExtendedInfo                                                          | [{"ExtendedInfoType":"KEEP_ACCESS_SP"}]  |


    # Vérification unité Acquisition du matériel (élimination)

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}, {"$eq": {"Title": "Acquisition du matériel (élimination)"}}]}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques

    Alors les metadonnées sont
      | #elimination.0.GlobalStatus                                                          | DESTROY                                |
      | #elimination.0.DestroyableOriginatingAgencies                                        | ["FRAN_NP_050634_elim"]                |
      | #elimination.0.NonDestroyableOriginatingAgencies                                     | []                |
      | #elimination.0.ExtendedInfo                                                          | []  |


    # Vérification unité Gestion du matériel (élimination)

    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}, {"$eq": {"Title": "Gestion du matériel (élimination)"}}]}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques

    Alors les metadonnées sont
      | #elimination.0.GlobalStatus                                                          | DESTROY                                |
      | #elimination.0.DestroyableOriginatingAgencies                                        | ["FRAN_NP_050634_elim"]                |
      | #elimination.0.NonDestroyableOriginatingAgencies                                     | []                |
      | #elimination.0.ExtendedInfo                                                          | []  |

