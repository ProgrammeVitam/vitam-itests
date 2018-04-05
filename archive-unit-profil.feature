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

  Scénario: Recherche de document type
    Quand je cherche un document type nommé ArchiveUnitProfileTNR
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileTNR            |
      | Description | Test d'import d'un document type |

  Scénario: Import de document type avec schéma
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profile_ok_custom_schema.json
    Alors je fais un import du document type

  Scénario: Recherche de document type avec schéma
    Quand je cherche un document type nommé ArchiveUnitProfileWithCustomSchemaTNR
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileWithCustomSchemaTNR        |
      | Description | Test d'import d'un document type avec schéma |
