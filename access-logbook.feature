# language: fr

@AccessLogbook
Fonctionnalité: Recherche dans le journal des opérations

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Upload d'un SIP et vérification du contenu du champ "evDetData"
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        | "{\"evDetDataType\":\"MASTER\",\"EvDetailReq\":\"2eme SIP\",\"EvDateTimeReq\":\"2016-10-18T14:52:27\",\"ArchivalAgreement\":\"ArchivalAgreement0\",\"AgIfTrans\":\"Identifier5\"}" |
