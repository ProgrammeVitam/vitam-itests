# language: fr

@Collect
@CollectIngest
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Contexte: Projet existant dans collect
    Étant donné Le module de collect est deployé
    Et les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et que j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et que j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et que le projet est créé en succès

  @Light
  Scénario: Import dans collect d'un SIP avec Règles de Gel complexes avec ManagementMetadata
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/SIP_OK_HoldRules_ManagementMetadata.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    # Vérification globale
    Quand j'utilise le fichier de requête suivant data/queries/select_all_units.json
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 8

    # Vérification Unit 1
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit1"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit1.json

    # Vérification Unit 2
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit2"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit2.json

    # Vérification Unit 3
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit3"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit3.json

    # Vérification Unit 4
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit4"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit4.json

    # Vérification Unit 5
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit5"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit5.json

    # Vérification Unit 6
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit6"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit6.json

    # Vérification Unit 7
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit7"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit7.json

    # Vérification Unit 8
    Alors j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$and": [ {"$eq":{"#opi":"Operation-Id"}}, {"$eq": {"Title": "Unit8"}}]} ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Et les métadonnées de gestion correspondent au fichier json data/expectedJson/HoldRules_ManagementMetadata_ExpectedUnit8.json
