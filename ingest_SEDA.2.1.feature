# language: fr

@Ingest
@Ingest_OG_CHECK_AND_TRANSFORME
Fonctionnalité: SEDA 2.1
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_DIGEST

### OK

  Scénario: Test d'un ingest en SEDA 2.1
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_FULL_SEDA2.1.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est monSIP
    Alors les statuts des événements LFC.OG_METADATA_INDEXATION est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_seda2.1_fields.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        |     "{\n  \"EvDetailReq\" : \"SIP SEDA 2.1\",\n  \"EvDateTimeReq\" : \"2016-10-18T14:52:27\",\n  \"ArchivalAgreement\" : \"ArchivalAgreement0\",\n  \"ServiceLevel\" : null,\n  \"AcquisitionInformation\" : \"AcquisitionInformation0\",\n  \"LegalStatus\" : \"Private Archive\"\n}" |
    Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_opc.json
    Et je recherche les détails des registres de fond pour le service producteur FRAN_NP_009913
    Alors les metadonnées pour le détail du registre de fond sont
      | LegalStatus                    | Private Archive                      |
      | AcquisitionInformation         | AcquisitionInformation0              |
