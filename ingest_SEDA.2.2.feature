# language: fr

@Ingest
@Ingest_OG_CHECK_AND_TRANSFORME
@SEDA_2.2
Fonctionnalité: SEDA 2.2
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Scénario d'import de profil d'archivage déclarant un contrat d'entrée qui déclare ce profil
    Etant donné un profil nommé data/profiles/profiles_for_tnr_rng_seda_2.2_ok.json
    Alors j'importe le profile d'archivage sans échec
    Etant donné un profil nommé data/profiles/OK_profilRNG_mail_Seda2.2.rng
    Et je cherche un profil nommé profilTrnRngTest
    Et je rattache un ficher à ce profil d'archivage sans échec
    Etant donné un contract nommé data/contracts/contract_with_profil_seda_2.2.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Import de profil d'unités archivistiques contenant des métadonnées en seda 2.2 - OK
    Etant donné un document type nommé data/archiveUnitProfiles/OK_AUP_schema_mail_Seda2.2.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfile2.2           |
      | Description | Test d'import d'un document type en SEDA 2.2 |

  Scénario: Test OK d'un ingest en SEDA 2.2 avec un profil d'archivage
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIPWithAP_mail_Seda2.2.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING
    Et je nomme l'identifiant de l'opération OperationId1
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
       "$in":{"#opi":["Named-Operation-Id<OperationId1>"]}
    }
  ],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 4
    Alors tous les résultats contiennent la propriété "#sedaVersion" dont la valeur est "2.2"
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData | "{\n  \"EvDetailReq\" : \"Catherine JABLASY : mails\",  \"EvDateTimeReq\" : \"2018-02-02T17:25:44\",  \"ArchivalAgreement\" : \"IC-000001\",  \"ArchivalProfile\" : \"PROFIL_TNR_RNG_TEST\",  \"ServiceLevel\" : null}" |
    Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_opc.json
    Et je recherche les détails des registres de fond pour le service producteur Service_producteur
    Alors les metadonnées pour le détail du registre de fond sont
      | OriginatingAgency      | Service_producteur        |
      | Comment                | Catherine JABLASY : mails |

  Scénario: Test OK d'un ingest en SEDA 2.2 avec un profil d'unité archivistique
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIPwith2AUP_mail_Seda2.2.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING
    Et je nomme l'identifiant de l'opération OperationId1
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
       "$in":{"#opi":["Named-Operation-Id<OperationId1>"]}
    }
  ],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 3
    Alors tous les résultats contiennent la propriété "#sedaVersion" dont la valeur est "2.2"
    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData | "{\n  \"EvDetailReq\" : \"Catherine JABLASY : mails\",  \"EvDateTimeReq\" : \"2018-02-02T17:25:44\",  \"ArchivalAgreement\" : \"ArchivalAgreement0\",  \"ServiceLevel\" : null}" |
    Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_opc.json
    Et je recherche les détails des registres de fond pour le service producteur Service_producteur
    Alors les metadonnées pour le détail du registre de fond sont
      | OriginatingAgency      | Service_producteur        |
      | Comment                | Catherine JABLASY : mails |

  Scénario: Test KO d'un ingest en SEDA 2.2
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/SIP_2.1_WITH_FIELD_2.2.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Alors l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO

  Scénario: Test d'un ingest en SEDA 2.2
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_FULL_SEDA2.2.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est monSIP
    Alors les statuts des événements LFC.OG_METADATA_INDEXATION est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_seda2.2_fields.json
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
