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

  @Light
  Scénario: Import dans collect d'un SIP avec une empreinte MD5
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP-test-md5.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK

  Scénario: Import dans collect d'un SIP avec empreinte SHA-512
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_EMPRT_SHA256_2.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK

  Scénario: Import dans collect d'un SIP avec un fichier sans extension
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_FILES_sans_extention.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK

### KO

  @Light
  Scénario: Import dans collect d'un SIP empreinte invalide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_empreinte_KO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

  Scénario: Import dans collect d'un SIP avec empreinte vide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/DIGEST_VIDE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

##### OG_OBJECTS_FORMAT_CHECK

### WARNING

  Scénario: Import dans collect d'un SIP ave contrôles sur les formats
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_WARNING/ZIP/WARNING_FORMAT_Varies.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING

  Scénario: Import dans collect d'un SIP avec PUID incohérents
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_WARNING/ZIP/WARNING_FORMT_PUID-incoherent.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING

### KO

  Scénario: Import dans collect d'un SIP avec format inconnu
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_FORMT_INCONNU.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

  Scénario: Import dans collect d'un SIP format non reconnu dans le référentiel Vitam ("uncharted")
    Etant donné les tests effectués sur le tenant 1
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V94_Light.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |
    Etant donné les tests effectués sur le tenant 0
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_FORMAT_UNCHARTED.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO

  Scénario: Cleanup (finally) : Reset référentiel PRONOM
    Etant donné les tests effectués sur le tenant 1
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V121.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |
    Etant donné les tests effectués sur le tenant 0
