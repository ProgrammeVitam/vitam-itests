# language: fr

@Contacts
Fonctionnalité: Tests d'import et de recherche de documents type

  Contexte: un document type ne doit être importé qu'une seule fois. Je pré-suppose que cette feature ne sera executée qu'une seule fois.
    Etant donné les tests effectués sur le tenant 1
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Import de document type
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profiles_ok.json
    Alors je fais un import du document type
    Et le statut final du journal des opérations est OK

  Scénario: Recherche de document type
    Quand je cherche un document type nommé ArchiveUnitProfile
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfile               |
      | Description | Test d'import d'un document type |

################################################################################################################

  Scénario: Tentative d'import KO d'un document type déjà existant
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profiles_ok.json
    Alors je fais un import du document type
    Et le statut final du journal des opérations est KO
    Et le champ 'evDetData' de l'évenement final est : "Duplicate Field" : "The archive unit profile identifier AUP_IDENTIFIER already exists in database"

  Scénario: Tentative d'import KO d'un document type avec un champ obligatoire manquant
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_Champsrequisvides.json
    Alors je fais un import du document type
    Alors les metadonnées sont
      | Code | 400 |

  Scénario: Tentative d'import KO d'un document type, car il est au mauvais format
    Etant donné un document type nommé data/archiveUnitProfiles/KO_archiveUnitProfile_format.csv
    Alors je fais un import du document type
    Alors les metadonnées sont
      | Code | 412 |
#
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   #Le format du fichier ne correspond pas au format attendu.

  Scénario: Tentative d'import KO d'un document type, car les valeurs sont incorrectes
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_IncorrectValues.json
    Alors je fais un import du document type
    Alors les metadonnées sont
      | Code | 400 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Au moins un objet déclare une valeur incorrecte.

  Scénario: Tentative d'import KO d'un document type, car injection HTML
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_InjectionHTML_description.json
    Alors je fais un import du document type
    Alors les metadonnées sont
      | Code | 412 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Le format du fichier ne correspond pas au format attendu.


###################################################################################################################

################################################################################################################

  Scénario: Import de document type avec schéma
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profile_ok_custom_schema.json
    Alors je fais un import du document type
    Et le statut final du journal des opérations est OK

  Scénario: Recherche de document type avec schéma
    Quand je cherche un document type nommé ArchiveUnitProfileWithCustomSchema
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileWithCustomSchema           |
      | Description | Test d'import d'un document type avec schéma |
