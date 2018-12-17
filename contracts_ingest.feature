# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contrats (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_for_tnr_ok.json
    Quand j'importe ce contrat de type INGEST_CONTRACTS
  #test KO IHM recette / OK local

######################

Scénario: Import d’un contrat d’entrée champ « Formats non identifiés autorisés » à TRUE
    Etant donné un contract nommé data/contracts/entree/OK_contracts_FormatUnidentifiedAuthorized_ok.json
    Quand j'importe ce contrat de type INGEST_CONTRACTS
#test KO IHM recette / KO local

Scénario: Import d'un contrat d'entrée avec le champ « Formats non identifiés autorisés » à FALSE
    Etant donné un contract nommé data/contracts/entree/OK_contracts_FormatUnidentifiedAuthorized_ok.json
    Quand j'importe ce contrat de type INGEST_CONTRACTS
    #Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du contrat d'entrée
#test KO IHM recette / Ko local

Scénario: Import d'un contrat d'entrée avec le champ « Formats non identifiés autorisés » champ absent
    Etant donné un contract nommé data/contracts/entree/OK_contract_FormatUnidentifiedAuthorized_absent.json
    Quand j'importe ce contrat de type INGEST_CONTRACTS
    #Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du contrat d'entrée
#test KO IHM recette / KO local

Scénario: import OK de contrats d'entrée avec le champ FormatUnidentifiedAuthorized correct
    Etant donné un contract nommé data/contracts/entree/contract_FormatUnidentifiedAuthorized_ok.json
    Quand j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_les_objets_non_identifies
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Rejette_les_objets_non_identifies
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
#test KO IHM recette / OK local

  Scénario: import OK de contrats d'entrée avec le champ EveryFormatType et FormatType corrects
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ok.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_tous_les_formats
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_by_parameter.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Identifier
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Accepte_formats_liste_blanche
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Import de contrat avec un minimum d'informations
    Etant donné un contract nommé data/contracts/entree/contract_minimal.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand je cherche un contrat de type INGEST_CONTRACTS et nommé Minimal_contract_with_the_less_fields_as_possible
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Status                 | INACTIVE    |
      | CheckParentLink        | INACTIVE    |
      | MasterMandatory        | true        |
      | EveryDataObjectVersion | false       |
#test KO IHM recette / KO local

# Cas KO

  Scénario: Tentative d'import KO d'un contrat d'entrée déjà existant
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    #test OK IHM recette / OK local

  Scénario: Import de deux contrats d'ingest de même noms
    Etant donné un contract nommé data/contracts/two_same_name_ingest_contracts.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS

Scénario: Import d'un contrat d'entrée avec le champ "Tous les formats" en FALSE et une liste de format non conforme
    Etant donné un contract nommé data/contracts/entree/KO_contract_FormatType_unknown.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    #Et le champ 'outMessg' de l'évenement final est : Echec de l'import : Un ou plusieurs formats ne sont pas référencés dans le Référentiel des formats
    #Et le champ 'evDetData' de l'évenement final est : ingestContractCheck" : "One or multiple file format Rejette_tous_formats_mais_mauvaise_liste_blanche not found in db
#test KO IHM recette / Ok local

Scénario: Import d'un contrat d'entrée avec le champ "Tous les formats" en FALSE et une liste de format vide
    Etant donné un contract nommé data/contracts/entree/KO_contract_FormatType_empty.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    #Et le champ 'outMessg' de l'évenement final est : Échec de l'import : La liste blanches des formats ne peut pas être vide lorsque tous les formats ne sont pas autorisés
    #Et le champ 'evDetData' de l'évenement final est : ingestContractCheck" : "formatType field must not be empty when everyFormat is false
#test KO IHM recette / Ok local

# Ajout au cahier de recette 

Scénario: import d'un contrat d’entrée au mauvais format
   Etant donné un contract nommé data/contracts/entree/referential_contracts_KO.pdf
   Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette/ Ok local

Scénario: import d'un contrat d’entrée qui n'est pas au format json
   Etant donné un contract nommé data/contracts/entree/KO_Contrat_entree_JSON_ne_correspond_pas_au_modele_attendu.json
   Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
   #test KO IHM recette / KO local

Scénario: Import d’un contrat d’entrée Champ obligatoire non renseigné
    Etant donné un contract nommé data/contracts/entree/KO_referential_contracts_Champ_obligatoire_non_renseigne.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et le statut final du journal des opérations est KO
    #Et le champ 'outMessg' de l'évenement final est : Échec de l'import du contrat d'entrée : au moins un des champs obligatoires n'est pas renseigné
    #Et le champ 'evDetData' de l'évenement final est : Mandatory Fields" : "The field Name is mandatory
#test KO IHM recette / KO local

Scénario: Import d'un contrat d'entrée déclarant un Status dont la valeur n’est ni ACTIVE ni INACTIVE
    Etant donné un contract nommé data/contracts/entree/KO_erreur_valeur_champ-Status.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / OK local

Scénario: Import d'un contrat d'entrée déclarant une date au mauvais format
    Etant donné un contract nommé data/contracts/entree/KO_Contrat_entree_date_mauvais_format.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    #Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du contrat d'entrée : au moins un des champs obligatoires n'est pas renseigné
#test KO IHM recette / KO local

Scénario: Import d'un contrat d'entrée déclarant un LinkParentId inconnu du système
    Etant donné un contract nommé data/contracts/entree/KO_IC_INVALID_CheckParentLink.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
   #test OK IHM recette / ok local

Scénario: Import d'un contrat d'entrée déclarant un un ArchiveProfile inconnu du système
    Etant donné un contract nommé data/contracts/entree/KO_contractIngest_ArchiveProfile_inconnu.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
# bug à déclarer ne correspond pas au comportement attendu 
#test OK IHM recette / ok local

Scénario: Import d’un contrat d’entrée déclarant un FormatType inconnu du système
    Etant donné un contract nommé data/contracts/entree/KO_contractIngest_FormatType_inconnu.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et le statut final du journal des opérations est KO
    #Et le champ 'outMessg' de l'évenement final est : Echec de l'import : Un ou plusieurs formats ne sont pas référencés dans le Référentiel des formats
    #Et le champ 'evDetData' de l'évenement final est : Mandatory Fields" : "ingestContractCheck" : "One or multiple file format Rejette_tous_formats_mais_mauvaise_liste_blanche not found in db
#test KO IHM recette / ok local en commentant 

Scénario: Import d’un contrat d’entrée dont le EveryFormatType a pour valeur TRUE et dont FormatType ne possède pas de valeur
    Etant donné un contract nommé data/contracts/entree/KO_contractIngest_FormatType_inconnu.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
    Et le statut final du journal des opérations est KO
    #Et le champ 'outMessg' de l'évenement final est : Echec de l'import :Échec de l'import : La liste blanche des formats doit être vide lorsque tous les formats sont autorisés
    #Et le champ 'evDetData' de l'évenement final est : Mandatory Fields" : "ingestContractCheck" : "ingestContractCheck" : "formatType field must be empty when everyFormat is true
#test KO IHM recette / ok local en commentant 

  Scénario: Tentative d'import de contrat d'accès ko (nom manquant)
    Etant donné les tests effectués sur le contrat id ContratTNR
    Et un contract nommé data/contracts/ko_contrat_acces_name_manquant.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local 

  Scénario: Tentative d'import de contrat d'accès ko (fichier xml)
    Etant donné un contract nommé data/contracts/ko_contrat_acces.xml
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local 

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (nom manquant)
    Etant donné un contract nommé data/contracts/ko_referential_contracts_INVALID_MissingName.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (fichier xml)
    Etant donné un contract nommé data/contracts/ko_referential_contracts.xml
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (Id du plan parent est incorrect)
    Etant donné un contract nommé data/contracts/referential_contracts_unknowID_ko.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Scénario: Tentative d'import de contrat d'entrée ko (JSON contenant des contenus HTML toxiques)
    Etant donné un contract nommé data/contracts/JSON_HTML.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ FormatUnidentifiedAuthorized dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_FormatUnidentifiedAuthorized_ko_1.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=true mais FormatType possède une valeur
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_1.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=true et FormatType dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_2.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType dont la valeur est invalide
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_3.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType dont la valeur est vide (tableau vide)
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_4.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local

  Scénario: Tentative d'import KO d'un contrat d'entrée avec le champ EveryFormatType=false et FormatType est absent du fichier JSON importé
    Etant donné un contract nommé data/contracts/entree/contract_EveryFormatType_ko_5.json
    Quand j'importe ce contrat incorrect de type INGEST_CONTRACTS
#test OK IHM recette / ok local
    
  Scénario: Import de contrat avec un minimum d'informations
    Etant donné un contract nommé data/contracts/entree/contract_minimal.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand je cherche un contrat de type INGEST_CONTRACTS et nommé Minimal_contract_with_the_less_fields_as_possible
    Alors le contrat existe
    Et les métadonnées du contrat sont
      | Name        | ArchivalAgreement0 |
      | Description | Contrat Vitam 0    |
#test OK IHM recette / ok local

  Scénario: CONTRACTS - recherche de contrats d'entrée ordonnés par Name (desc)
    Etant donné un contract nommé data/contracts/referential_contracts_ok_sort.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Quand j'utilise le fichier de requête suivant data/queries/select_ingest_contract_order_name_desc.json
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Et les metadonnées sont
      | Name       | ZimbabweArchivalAgreement  |
      | Identifier | ZimbabweArchivalAgreement0 |
#test KO IHM recette / Ko local
