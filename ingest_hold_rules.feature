# language: fr

@Ingest
@Ingest_Hold_Rules
Fonctionnalité: Ingest des Hold Rules
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  @Light
  Scénario: Test d'un ingest SIP avec Règles de Gel complexes avec ManagementMetadata
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/SIP_OK_HoldRules_ManagementMetadata.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    # Vérification globale
    Quand j'utilise le fichier de requête suivant data/queries/select_all_units.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 8

    # Vérification Unit 1
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit1"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit1.json

    # Vérification Unit 2
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit2"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit2.json

    # Vérification Unit 3
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit3"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit3.json

    # Vérification Unit 4
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit4"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit4.json

    # Vérification Unit 5
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit5"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit5.json

    # Vérification Unit 6
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit6"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit6.json

    # Vérification Unit 7
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit7"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit7.json

    # Vérification Unit 8
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit8"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit8.json
