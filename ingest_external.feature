# language: fr

@Ingest_External
Fonctionnalité: uploader des fichiers SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  # Je m'assure que les contracts d'entrée sont bient importés
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: SIP au mauvais format
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_Mauvais_Format.pdf
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO

  Scénario: Test virus
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement SANITY_CHECK_SIP est KO

  Scénario: SIP avec un fichier dont l'extension contient un caractère spécial
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_FILE_extension_caractere_special.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_UPLOAD_SIP, PROCESS_SIP_UNITARY sont KO