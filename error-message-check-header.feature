# language: fr

@ErrorMessageCheckHeader
Fonctionnalité: Vérifier les messages d'erreur
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 1


  Scénario: Importer le profile
    Etant donné un profil nommé data/profiles/PR_2194.json
    Alors je fais un import du profile d'archivage

  Scénario: Import des contrats necessaires pour tester
    Etant donné un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et un contract nommé data/contracts/IC_2194.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS


  Scénario: Tester un import en déclarant un autre profil que le contrat d'entrée
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_DIFF.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.DIFF.KO

  Scénario: Tester un Contrat inexistant
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_IC_INEXISTENT.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.UNKNOWN.KO

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

  Scénario: Tester un contrat existant mais inactif
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_IC_INACTIVE.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_CONTRACT_INGEST est CHECK_HEADER.CHECK_CONTRACT_INGEST.INACTIVE.KO

  Scénario: Tester un import en déclarant un profil existant mais inactif
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/2194_INACTIVE_PROFIL.zip
    Quand je télécharge le SIP
    Alors le statut de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_IC_AP_RELATION est CHECK_HEADER.CHECK_IC_AP_RELATION.INACTIVE.KO
