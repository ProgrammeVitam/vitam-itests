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

################################################################################################################

  Scénario: Tentative d'import KO d'un document type déjà existant
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profiles_ok.json
    Alors j'importe ce document type en échec
    Et je recherche le journal des opérations
    Alors les metadonnées sont
      | evDetData        | "{ "Duplicate Field" : "The archive unit profile name ArchiveUnitProfileTNR already exists in database" } " |

  Scénario: Tentative d'import KO d'un document type avec un champ obligatoire manquant
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_Champsrequisvides.json
    Alors j'importe ce document type en échec
    Et je recherche le journal des opérations
    Alors les metadonnées sont
      | evDetData        | "{ "Mandatory Fields" : "The field Name is mandatory,The field ControlSchema is mandatory" } " |

  Scénario: Tentative d'import KO d'un document type, car il est au mauvais format
    Etant donné un document type nommé data/archiveUnitProfiles/KO_archiveUnitProfile_format.csv
    Alors j'importe ce document type en échec

   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   #Le format du fichier ne correspond pas au format attendu.

  Scénario: Tentative d'import KO d'un document type, car les valeurs sont incorrectes
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_IncorrectValues.json
    Alors j'importe ce document type en échec

   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Au moins un objet déclare une valeur incorrecte.

  Scénario: Tentative d'import KO d'un document type, car injection HTML
    Etant donné un document type nommé data/archiveUnitProfiles/document_type_KO_InjectionHTML_description.json
    Alors j'importe ce document type en échec

   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Le format du fichier ne correspond pas au format attendu.


###################################################################################################################

################################################################################################################

  Scénario: Import de document type avec schéma
    Etant donné un document type nommé data/archiveUnitProfiles/archive_unit_profile_ok_custom_schema.json
    Alors je fais un import du document type

  Scénario: Recherche de document type avec schéma
    Quand je cherche un document type nommé ArchiveUnitProfileWithCustomSchemaTNR
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileWithCustomSchemaTNR        |
      | Description | Test d'import d'un document type avec schéma |
