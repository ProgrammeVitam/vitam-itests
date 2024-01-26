# language: fr

@UnitExternalSchema
Fonctionnalité: Import du schema externe

  Contexte: Avant de lancer cette suite de test
    Etant donné les tests effectués sur le tenant 0

  Scénario: importation d'un schema externe
    Etant donné un fichier schema nommé data/schema/external_schema.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK

  Scénario: Vérification et import d'une ontologie au bon format
    Etant donné un fichier schema nommé data/schema/external_schema_plus.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK


  Scénario: Vérification et import d'une ontologie au mauvais format
    Quand un fichier schema nommé data/ontology/wrong_schema_format.csv
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 412 |



  Scénario: Vérification et import d'un schema contenant un path en doublon
    Etant donné un fichier schema nommé data/schema/external_schema_duplicated_paths.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import

  Scénario: Vérification et import d'un schema contenant un path en existe dans le schema interne
    Etant donné un fichier schema nommé data/schema/external_schema_already_in_internal_schema.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import


