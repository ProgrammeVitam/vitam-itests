# language: fr

@AccessLogbook
Fonctionnalité: Recherche dans le journal des opérations

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès.
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Upload d'un SIP et vérification du contenu du champ "evDetData"
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        | "{\n  \"EvDetailReq\" : \"2eme SIP\",\n  \"EvDateTimeReq\" : \"2016-10-18T14:52:27\",\n  \"ArchivalAgreement\" : \"ArchivalAgreement0\",\n  \"ServiceLevel\" : null\n}" |

  Scénario: Upload d'un SIP et récupération du logbook ordonné par type de process : UPDATE (desc) / INGEST (asc) 
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_02
    Alors les metadonnées sont
      | Title            | dossier1 |
		Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Et je modifie les unités archivistiques
    Et j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id_order_desc_date.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evTypeProc        | UPDATE |
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id_order_asc_date.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evTypeProc        | INGEST |


  Scénario: Vérifier les journaux de cycles de vies de l'unité archivistique et du group objet technique
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_title.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | Fichier 2 nouveau jeu de test |
    Quand je recherche le JCV de l'unité archivistique dont le titre est Fichier 2 nouveau jeu de test
    Alors les statuts des événements LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Fichier 2 nouveau jeu de test
    Alors les statuts des événements LFC.CHECK_CONSISTENCY, LFC.CHECK_DIGEST, LFC.OG_OBJECTS_FORMAT_CHECK, LFC.OBJ_STORAGE, LFC.OG_METADATA_INDEXATION sont OK


  Scénario: Upload d'un SIP en passant d'identifiant de transaction et vérification du contenu du champ "evIdAppSession"
      Etant donné les tests effectués sur le tenant 0
      Et les tests effectués avec l'identifiant de transaction APP_SESSION_ID
      Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
      Quand je télécharge le SIP
      Et j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
      Et je recherche les journaux d'opération
      Alors les metadonnées sont
        | evIdAppSession        | APP_SESSION_ID           |
