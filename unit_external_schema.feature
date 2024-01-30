# language: fr

@UnitExternalSchema
Fonctionnalité: Import du schema externe

  Contexte: Avant de lancer cette suite de test
    Etant donné les tests effectués sur le tenant 0

  Scénario: Importation d'un schema externe
    Etant donné un fichier schema nommé data/schema/external_schema.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK



  Scénario: Vérification et import d'un schema externe au bon format
    Etant donné un fichier schema nommé data/schema/external_schema_plus.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK


  Scénario: Vérification et import d'un schema externe au mauvais format
    Quand un fichier schema nommé data/schema/wrong_schema_format.csv
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 412 |


