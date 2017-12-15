# language: fr

@Ingest_OG_CHECK_HEADER
Fonctionnalité: uploader des fichiers SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  # Je m'assure que les contracts d'entrée sont bient importés

  Scénario: Importer le profile
    Etant donné un profil nommé data/profiles/PR_2194.json
    Alors je fais un import du profile d'archivage

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et un contract nommé data/contracts/IC_2194.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_HEADER.CHECK_AGENT #####

  @CheckHeaderWithoutOriginatingAgency
  Scénario: Test SIP without originating agency KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_WHITOUT_ORIGINATING_AGENCY.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO

  Scénario: OriginatingAgency absent
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_REGISTRE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO

  Scénario: OriginatingAgency invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OriginatinAgency_Invalid.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO

  Scénario: SubmissionAgency invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SubmissionAgency_Invalid.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO

##### CHECK_HEADER.CHECK_CONTRACT_INGEST #####

## OK

  Scénario: Test upload SIP with valid contract OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_HEADER.CHECK_CONTRACT_INGEST, STP_INGEST_CONTROL_SIP sont OK

## KO 

 Scénario: Test SIP with empty ArchivalAgreement in the manifest KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_With_Empty_ArchivalAgreement_Tag_In_Manifest.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, STP_INGEST_CONTROL_SIP, CHECK_HEADER.CHECK_CONTRACT_INGEST, PROCESS_SIP_UNITARY sont KO

  Scénario: Test SIP without ArchivalAgreement tag in the manifest KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_Without_ArchivalAgreement_Tag_In_Manifest.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, STP_INGEST_CONTROL_SIP, CHECK_HEADER.CHECK_CONTRACT_INGEST, PROCESS_SIP_UNITARY sont KO

  Scénario: Tester un Contrat inexistant
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_IC_INEXISTENT.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.UNKNOWN.KO

  Scénario: Tester un contrat existant mais inactif
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_IC_INACTIVE.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.INACTIVE.KO

##### CHECK_HEADER.CHECK_IC_AP_RELATION #####

### OK

  Scénario: Test SIP with profil OK (US 468 and US_2557)
    Etant donné les tests effectués sur le tenant 1
    Etant donné un profil nommé data/profiles/profiles_for_tnr_rng_ok.json
    Alors je fais un import du profile d'archivage
    Etant donné un profil nommé data/profiles/profil_ok.rng
    Et je rattache un ficher à ce profil d'archivage
    Etant donné un contract nommé data/contracts/contract_with_profil.json
    Alors j'importe ce contrat de type INGEST_CONTRACTS
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_468.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_HEADER.CHECK_IC_AP_RELATION, CHECK_HEADER.CHECK_ARCHIVEPROFILE sont OK

### KO

  Scénario: Tester un import en déclarant un autre profil que le contrat d'entrée
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_DIFF.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.DIFF.KO

  Scénario: Tester un import en déclarant un profil dans le contrat mais inexistant dans le manifest
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_INEXISTENT_PROFIL_IN_MANIFEST.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.DIFF.KO

  Scénario: Tester un import en déclarant dans le manifest un profil inexistant
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_INEXISTENT_PROFIL.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.UNKNOWN.KO

  Scénario: Tester un import en déclarant un profil existant mais inactif
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_INACTIVE_PROFIL.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.INACTIVE.KO

  Scénario: Test SIP with profil KO (US 468, US_2725 and US_2557)
    Etant donné les tests effectués sur le tenant 1
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_468.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
    Et je recherche les journaux d'opération
    Alors les metadonnées sont
      | evDetData        | Title\\\\\" invalid; must be equal to \\\\\\"Versement de la matrice cadastrale num\\\\u00E9rique |