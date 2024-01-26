# language: fr

@PersistentIdentifier
Fonctionnalité: recherche sur les identifiants ARK

  Contexte: Avant de lancer cette suite de test, je présuppose que le contrat de gestion avec ID pérenne est chargé et déclaré dans un contrat d'entrée.
    Etant donné les tests effectués sur le tenant 1
    Et un contract nommé data/contracts/management/OK_contract_management_IdentificationPolicy.json
    Et j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et un contract nommé data/contracts/entree/referential_contracts_ark.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Import SIP avec identifiants pérennes
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_images_2Binary-1Physical_withIdArk_2.2.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    # Check that a persistent identifier was generated for PersistentIdentifierReference 12354
    Quand j'utilise le fichier de requête suivant data/queries/select_basic_projection.json
    Et je recherche l'unité archivistique ayant l'identifiant pérenne ark:/22567/001a957db5eadaac
    Alors les metadonnées sont
      | Title                                                | Image de lac - 1 |
      | PersistentIdentifier.1.PersistentIdentifierType      | "ark"            |
      | PersistentIdentifier.1.PersistentIdentifierReference | "12354"          |
      | PersistentIdentifier.1.PersistentIdentifierContent   | "ark:/12354/     |
    # Check that we can download an object by its unit's persistent id
    Quand je télécharge l'objet ayant le qualifier BinaryMaster rattaché à une unité archivistique ayant l'identifiant pérenne ark:/22567/001a957db5eadaac
    Alors le hash SHA-512 du fichier transféré est a7c15313969583c478b2d66ad1a4b34e250d6751ee4b39e546a77f9c0d71ccefee55e2661b457f9e848a4e2d45d831058d3f61c1914b7fd45a168bace27f1d6f
    # Check that we can get metadata of an object by its persistent id
    Quand j'utilise le fichier de requête suivant data/queries/select_basic_projection.json
    Et je recherche l'objet ayant l'identifiant pérenne ark:/23567/001a9d7db5eadabac_binary_master
    Alors les metadonnées sont
      | FileInfo.LastModified | "2021-05-14T16:02:35" |
    # Check that we can download an object by its persistent id
    Quand je télécharge l'objet ayant l'identifiant pérenne ark:/23567/001a9d7db5eadabac_binary_master
    Alors le hash SHA-512 du fichier transféré est a7c15313969583c478b2d66ad1a4b34e250d6751ee4b39e546a77f9c0d71ccefee55e2661b457f9e848a4e2d45d831058d3f61c1914b7fd45a168bace27f1d6f
