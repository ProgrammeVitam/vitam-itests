# language: fr

@Contracts
Fonctionnalité: Tests d'imports et de recherches de contrats de gestion

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

################################

# Import d'un contrat de gestion

  Scénario: MANAGEMENT_CONTRACTS - Import de contrat de type contract de gestion
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat de type MANAGEMENT_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le champ 'outDetail' de l'évenement final est : STP_IMPORT_MANAGEMENT_CONTRACT.OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du contrat de gestion

  Scénario: MANAGEMENT_CONTRACTS - Tentative d'import KO d'un contrat de gestion déjà existant
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec de l'import du contrat de gestion : l'identifiant est déjà utilisé
    Et le champ 'evDetData' de l'évenement final est : Duplicate Field" : "The contract MCNoStorage already exists in database

  Scénario: MANAGEMENT_CONTRACTS - Import d'un contrat de gestion dont la structure json n'est pas valide
    Etant donné un contract nommé data/contracts/management/KO_contract_management_invalid_json_format.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS

  Scénario: MANAGEMENT_CONTRACTS - Import d'un contrat de gestion avec un champ obligatoire absent
    Etant donné un contract nommé data/contracts/management/KO_contract_management_missing_name.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec de l'import du contrat de gestion : au moins un des champs obligatoires n'est pas renseigné
    Et le champ 'evDetData' de l'évenement final est : Mandatory Fields" : "The field Name is mandatory

  Scénario: MANAGEMENT_CONTRACTS - Import d'un contrat de gestion contenant des contenus HTML toxiques
    Etant donné un contract nommé data/contracts/management/KO_contract_management_html.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS

  Scénario: MANAGEMENT_CONTRACTS - Import d'un contrat de gestion déclarant un Status dont la valeur n’est ni ACTIVE ni INACTIVE
    Etant donné un contract nommé data/contracts/management/KO_contract_management_invalid_status.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS

  Scénario: MANAGEMENT_CONTRACTS - Import d'un contrat de gestion déclarant une stratégie de stockage inexistante dans le système
    Etant donné un contract nommé data/contracts/management/KO_contract_management_storage_strategy.json
    Quand j'importe ce contrat incorrect de type MANAGEMENT_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec de l'import du contrat de gestion : stratégie de stockage non trouvée ou invalide
    Et le champ 'evDetData' de l'évenement final est : managementContractCheck" : "Storage Strategy (fake-strategy-not-found) not found for the field Storage.UnitStrategy

################################

# Recherche de contrats de gestion

  Scénario: MANAGEMENT_CONTRACTS - recherche d'un contrat de gestion existant
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion avec stockage
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Identifier | MCDefaultStorageAll |
      | Name       | Contrat de gestion avec stockage |

  Scénario: MANAGEMENT_CONTRACTS - recherche d'un contrat de gestion non existant
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé FAKE-FAKE-FAKE-FAKE-FAKE
    Alors le contrat n'existe pas

  Scénario: MANAGEMENT_CONTRACTS - recherche d'un contrat de gestion par requête sur le champ Name
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_managementcontracts_by_Name.json
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion avec stockage
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Identifier | MCNoStorage |
      | Name       | Contrat de gestion sans stockage |


################################

# Update Management Contract

  Scénario: MAJ du contrat d'entrèe unset identifier KO
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion sans stockage
    Quand je modifie un contrat de type MANAGEMENT_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_identifier.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe unset status KO
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion sans stockage
    Quand je modifie un contrat de type MANAGEMENT_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_status.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe unset creation date KO
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion sans stockage
    Quand je modifie un contrat de type MANAGEMENT_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_creationdate.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe set fake attribute KO
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion sans stockage
    Quand je modifie un contrat de type MANAGEMENT_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_attribute.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe set fake status KO
    Etant donné un contract nommé data/contracts/management/OK_contract_management_default.json
    Quand j'importe ce contrat sans échec de type MANAGEMENT_CONTRACTS
    Et je cherche un contrat de type MANAGEMENT_CONTRACTS et nommé Contrat de gestion sans stockage
    Quand je modifie un contrat de type MANAGEMENT_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_status.json le statut de la requête est 400
