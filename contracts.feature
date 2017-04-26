# language: fr

@Contacts
Fonctionnalité: recherche d'un contrat existant

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Tentative d'import de contrat un contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat de type CONTRACTS

  Scénario: Tentative d'import de contrat un contract access
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS

  Scénario: CONTRACTS -recherche d'un contrat d'entree
    Quand je cherche un contrat de type CONTRACTS et nommé ArchivalAgreement0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | ArchivalAgreement0 |
      | Description | Contrat Vitam 0    |

  Scénario: ACCESS_CONTRACTS - recherche d'un contrat d'accès
    Quand je cherche un contrat de type ACCESS_CONTRACTS et nommé AccessContract0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | AccessContract0 |
      | Description | Contrat Acces 0 |
      
  Scénario: ACCESS_CONTRACTS - recherche de contrats d'accès ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/contrats_acces_ok_sort.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_access_contract_order_name_desc.json
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Et les metadonnées sont
      | Name        | Zimbabwe - ZIM archives nationales  |

  Scénario: CONTRACTS - recherche de contrats d'entrée ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/referential_contracts_ok_sort.json
    Alors j'importe ce contrat de type CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_order_name_desc.json
    Et je recherche les données dans le référentiel CONTRACTS
    Et les metadonnées sont
      | Name        | ArchivalAgreement1 |
