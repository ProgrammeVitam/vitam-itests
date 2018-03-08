# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de document types

  Contexte: un document type ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 1
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Import de  document type
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profiles_ok.json
    Alors je fais un import du document type

  Scénario: Recherche de decument type
    Quand je cherche un document type nommé ArchiveUnitProfileTNR
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileTNR            |
      | Description | Test d'import d'un document type |
