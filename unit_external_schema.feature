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
    Quand je recupère le schema
    Alors le schema doit contenir le path TNRSchema
    Alors le schema doit contenir le path TNRSchema.Provider
    Quand je cherche le schema ayant le path TNRSchema.Provider.BirthDate
    Alors le type détaillé du schema est DATETIME
    Et la taille de la chaîne de caractère du schema est indéfinie

  Scénario: Vérification et import d'un schema externe au bon format
    Etant donné un fichier schema nommé data/schema/external_schema_plus.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Quand je recupère le schema
    Quand je cherche le schema ayant le path TNRSchema.Provider.Address
    Alors le type détaillé du schema est STRING
    Et la taille de la chaîne de caractère du schema est SHORT

  Scénario: Vérification et import d'un schema externe au mauvais format
    Quand un fichier schema nommé data/schema/wrong_schema_format.csv
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: Vérification et import d'un schema externe existant déjà en interne
    Quand un fichier schema nommé data/schema/external_schema_already_in_internal_schema.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 400 |

  Scénario: Vérification et import d'un schema externe dupliquant un path
    Quand un fichier schema nommé data/schema/external_schema_duplicated_paths.json
    Quand j'importe le schema externe
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'evDetData' de l'évenement final est : Duplicate key Invoice.Provider.BirthDate
