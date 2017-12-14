# language: fr

@Ingest_OG_CHECK_AND_TRANSFORME
Fonctionnalité: uploader des fichier SIP - OG_CHECK_AND_TRANSFORME
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_DIGEST

### OK

  Scénario: SIP avec une empreinte MD5
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP-test-md5.zip
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK


  Scénario: Contrôle sur une empreinte SHA-512
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_EMPRT_SHA256_2.zip
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK


  Scénario: SIP avec un fichier sans extension
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_FILES_sans_extention.zip
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK

### KO

  Scénario: Empreinte invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_empreinte_KO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.INVALID.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

  Scénario: Empreinte vide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/DIGEST_VIDE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.EMPTY.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

##### OG_OBJECTS_FORMAT_CHECK

### WARNING

  Scénario: Contrôles sur les formats
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMAT_Varies.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING

    Scénario: Test PUID incohérents
      Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMT_PUID-incoherent.zip
      Quand je télécharge le SIP
      Alors le statut final du journal des opérations est WARNING
      Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont WARNING
      Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING
      Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING

### KO

  Scénario: Format inconnnu
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_FORMT_INCONNU.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
