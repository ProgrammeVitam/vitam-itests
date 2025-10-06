# language: fr

@Collect
@CollectIngest
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Contexte: Projet existant dans collect
    Étant donné Le module de collect est deployé
    Et les tests effectués sur le tenant 1
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et que j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et que j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et que le projet est créé en succès
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et que j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un profil nommé data/profiles/PR_2194.json
    Et que j'importe le profile d'archivage sans échec
    Et un contract nommé data/contracts/IC_2194.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_HEADER.CHECK_AGENT #####

  Scénario: Import dans collect d'un SIP sans service producteur KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_WHITOUT_ORIGINATING_AGENCY.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.EMPTY_REQUIRED_FIELD.KO

  Scénario: Import dans collect d'un SIP avec OriginatingAgency absent
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_REGISTRE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO

  Scénario: Import dans collect d'un SIP avec OriginatingAgency invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OriginatinAgency_Invalid.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO

  Scénario: Import dans collect d'un SIP avec SubmissionAgency invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SubmissionAgency_Invalid.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, CHECK_HEADER.CHECK_AGENT, STP_INGEST_CONTROL_SIP, PROCESS_SIP_UNITARY sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO

##### CHECK_HEADER.CHECK_CONTRACT_INGEST #####

## OK

  @Light
  Scénario: Test upload SIP with valid contract OK
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_HEADER.CHECK_CONTRACT_INGEST, STP_INGEST_CONTROL_SIP sont OK

## KO

  Scénario: Test SIP with empty ArchivalAgreement in the manifest KO
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SIP_With_Empty_ArchivalAgreement_Tag_In_Manifest.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, STP_INGEST_CONTROL_SIP, CHECK_HEADER.CHECK_CONTRACT_INGEST, COLLECT_SIP_INGEST sont KO

  Scénario: Test SIP without ArchivalAgreement tag in the manifest KO
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SIP_Without_ArchivalAgreement_Tag_In_Manifest.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER, STP_INGEST_CONTROL_SIP, CHECK_HEADER.CHECK_CONTRACT_INGEST, COLLECT_SIP_INGEST sont KO

  Scénario: Tester un Contrat inexistant
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_IC_INEXISTENT.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.CONTRACT_UNKNOWN.KO

  @Light
  Scénario: Tester un contrat existant mais inactif
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_IC_INACTIVE.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.CONTRACT_INACTIVE.KO

##### CHECK_HEADER.CHECK_IC_AP_RELATION #####

  Scénario: Tester un import en déclarant un autre profil que le contrat d'entrée
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_DIFF.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.DIFF.KO

  Scénario: Tester un import en déclarant un profil dans le contrat mais inexistant dans le manifest
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_INEXISTENT_PROFIL_IN_MANIFEST.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.DIFF.KO

  Scénario: Tester un import en déclarant dans le manifest un profil inexistant
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_INEXISTENT_PROFIL.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.UNKNOWN.KO

  Scénario: Tester un import en déclarant un profil existant mais inactif
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/2194_INACTIVE_PROFIL.zip
    Et je recherche le journal des opérations
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.INACTIVE.KO

### Test ingest with contract not in the context
  Scénario: Tester un import en déclarant un contrat d'entrée qui n'existe pas dans le contexte applicatif
    Etant donné les tests effectués sur le tenant 1
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_Contract_Not_IN_CONTEXT.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_HEADER.CHECK_CONTRACT_INGEST sont KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.CONTRACT_NOT_IN_CONTEXT.KO
