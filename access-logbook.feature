# language: fr

@AccessLogbook
Fonctionnalité: Recherche dans le journal des opérations

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès.
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type CONTRACTS

  Scénario: Upload d'un SIP et vérification du contenu du champ "evDetData"
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        | "{\"evDetDataType\":\"MASTER\",\"EvDetailReq\":\"2eme SIP\",\"EvDateTimeReq\":\"2016-10-18T14:52:27\",\"ArchivalAgreement\":\"ArchivalAgreement0\",\"AgIfTrans\":\"Identifier5\"}" |

  Scénario: Upload d'un SIP et récupération du logbook ordonné par type de process : UPDATE (desc) / INGEST (asc) 
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | monSIP |
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
