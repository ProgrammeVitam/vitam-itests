# language: fr

@Collect
@CollectIngest
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Contexte: Projet existant dans collect
    Étant donné Le module de collect est deployé
    Et les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et que j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et que j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et que le projet est créé en succès

##### CHECK_DIGEST

### OK

  Scénario: Import dans collect d'un SIP en SEDA 2.1
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP_FULL_SEDA2.1.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_seda2.1_fields.json
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        |     "{\n  \"EvDetailReq\" : \"SIP SEDA 2.1\",\n  \"EvDateTimeReq\" : \"2016-10-18T14:52:27\",\n  \"ArchivalAgreement\" : \"ArchivalAgreement0\",\n  \"ServiceLevel\" : null,\n  \"AcquisitionInformation\" : \"AcquisitionInformation0\",\n  \"LegalStatus\" : \"Private Archive\"\n}" |
