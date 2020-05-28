# language: fr

@Contracts
@AccessContracts
Fonctionnalité: Tests d'imports et de recherches de contrats accès

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

################################

# Import d'un contrat d'accès OK

  @Light
  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Quand j'importe ce contrat de type ACCESS_CONTRACTS
	 # test OK IHM recette / ok master

# Import d'un contrat d'accès KO

  #Scénario:Import de deux contrats d'accès de même noms
    #Etant donné un contract nommé data/contracts/two_same_name_access_contracts.json
    #Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Tentative d'import KO d'un contrat d'accès déjà existant
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario:Import d'un contrat d'accès avec un Service Producteur inconnu de Vitam
    Etant donné un contract nommé data/contracts/access/KO_OA_inconnu.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario:Import d'un contrat d'accès avec une valeur qui fait référence à un objet qui n’existe pas dans Vitam
    Etant donné un contract nommé data/contracts/access/KO_Contrat_acces_originatingagencie_unknown.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès dont la structure json n'est pas valide
    Etant donné un contract nommé data/contracts/access/KO_contrat_access_JSON_ne_correspond_pas_au_modele_attendu.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès avec un champ obligatoire absent
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_absence_champ_name.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès avec un champ supplémentaire
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_champ_supplementaire.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès contenant des contenus HTML toxiques
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_HTML.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès déclarant un Status dont la valeur n’est ni ACTIVE ni INACTIVE
    Etant donné un contract nommé data/contracts/access/KO_Contrat_acces_Statut_errone.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès déclarant une Agency inexistante dans le système
    Etant donné un contract nommé data/contracts/access/KO_Contrat_acces_originatingagencie_unknown.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du contrat d'accès : au moins un service agent est inconnu
    Et le champ 'evDetData' de l'évenement final est : Agency not found" : "Error while validating contract (Contrat_Acces_Par-Defaut), RootUnits (testlalalal) not found in database


  Scénario: Import d'un contrat d'accès déclarant un ExcludedRootsUnit inexistant dans le système
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_noeud_inaccesible_inconnu.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du contrat d'accès : erreur lors de la validation du contrat d'accès
 
  Scénario: Import d'un contrat d'accès déclarant un WrintingPermission dont la valeur n’est ni TRUE ni FALSE
    Etant donné un contract nommé data/contracts/access/KO_erreur_valeur_champ-WritingPermission.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès déclarant un EveryOriginatingAgency dont la valeur n’est ni TRUE ni FALSE
    Etant donné un contract nommé data/contracts/access/KO_erreur_valeur_champ-EveryOriginatingAgency.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès déclarant un AccessLog dont la valeur n’est ni TRUE ni FALSE
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_accesslog_vide.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS

  Scénario: Import d'un contrat d'accès déclarant une date au mauvais format
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_date_mauvais_format.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du contrat d'accès : au moins un des champs obligatoires n'est pas renseigné
    Et le champ 'evDetData' de l'évenement final est : Mandatory Fields" : "The field deactivationdate is mandatory

  Scénario: Import d'un contrat d'accès déclarant un usage inexistant dans le système
    Etant donné un contract nommé data/contracts/access/KO_contrat_acces_usage_inexistant.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario: Import d'un contrat d'accès déclarant un EveryOriginatingAgency à TRUE et une Agency dans la métadonnée correspondante
    Etant donné un contract nommé data/contracts/access/KO_Contrat_acces_originatingagencie_unknown.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du contrat d'accès : au moins un service agent est inconnu
    Et le champ 'evDetData' de l'évenement final est : "Agency not found" : "Error while validating contract (Contrat_Acces_Par-Defaut), RootUnits (testlalalal) not found in database"

  Scénario: Import d'un contrat d'accès déclarant un EveryDataObjectVersion à TRUE et un usage dans la métadonnée correspondante
    Etant donné un contract nommé data/contracts/access/KO_EveryDataObjectVersion_TRUE_champ_complete.json
    Quand j'importe ce contrat incorrect de type ACCESS_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

# Recherche d'un contrat d'accès

  @Light
  Scénario: ACCESS_CONTRACTS - recherche d'un contrat d'accès
    Quand je cherche un contrat de type ACCESS_CONTRACTS et nommé AccessContract0
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | AccessContract0 |
      | Description | Contrat Acces 0 |

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


  Scénario: ACCESS_CONTRACTS - recherche de contrats d'accès ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/contrats_acces_ok_sort.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_access_contract_order_name_desc.json
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Et les metadonnées sont
      | Name       | Zimbabwe - Air Zimbabwe |
      | Identifier | Zimbabwe_Air_Zimbabwe   |
