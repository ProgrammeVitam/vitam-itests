#language: fr

@MassUpdate
Fonctionnalité: Modifier en masse des métadonnées descriptives alors que le contrat d'accès interdit l'accès à un service producteur

    Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et un contract nommé data/contracts/contract_acces_TNR.json
      Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
      Et un contract nommé data/contracts/referential_contracts_ok.json
      Et j'importe ce contrat sans échec de type INGEST_CONTRACTS


    Scénario: Modifier une métadonnée descriptive alors que le contrat d'accès interdit l'accès à un service producteur - KO
        #ingest du 1er SIP
          Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RATP.zip
          Quand je télécharge le SIP
          Et je recherche le journal des opérations
          Alors le statut final du journal des opérations est OK
          Et je nomme l'identifiant de l'opération RatpOperationId

        #ingest du 2nd SIP
         Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_mail.zip
         Quand je télécharge le SIP
         Et je recherche le journal des opérations
         Alors le statut final du journal des opérations est WARNING
         Et je nomme l'identifiant de l'opération ServiceProducteurOperationId