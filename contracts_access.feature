# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contrats (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS

  Scénario:Import de deux contrats d'accès de même noms
    Etant donné un contract nommé data/contracts/two_same_name_access_contracts.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'accès déjà existant
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

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
      | Name       | Zimbabwe - Air Zimbabwe |
      | Identifier | Zimbabwe_Air_Zimbabwe   |

  Scénario: ACCESS_CONTRACTS - Ajout d'un noeud inaccessible
    Etant donné un contract nommé data/contracts/access/contract_acces_nodes.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS
    Et les tests effectués sur le contrat id ACForNodeOperations
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Alors je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur dossier_1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand je recherche une unité archivistique et je recupère son id
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ACForNodeOperations
    Et j'utilise le fichier de requête suivant data/queries/update/ok/update_contract_add_excluded_node.json
    Et j'utilise dans la requête le paramètre EXCLUDED_NODE_PARAM avec l'id
    Et je modifie un contrat d'accès et le statut de la requête est 200
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur dossier_1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
