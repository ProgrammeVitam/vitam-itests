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
#    # FIXME : No ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    # FIXME : No LFC
#    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Sensibilisation API
#    Alors les statuts des événements LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK est OK
#    # Il y a 4 occurrences de ces événements

  Scénario: Import dans collect d'un SIP avec empreinte SHA-512
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_EMPRT_SHA256_2.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK
#    # FIXME : No ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    # FIXME : No LFC
#    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est la nouvelle newsletter de vitam
#    Alors les statuts des événements LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK est OK
#    # Il y a 1 occurrence de ces événements

  Scénario: Import dans collect d'un SIP avec un fichier sans extension
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_FILES_sans_extention.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK
#    # FIXME : No ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    # FIXME : No LFC
#    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Integer rutrum condimentum
#    Alors les statuts des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est OK
#    # Il y a 1 occurrence de ces événements

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
#    # FIXME : No ATR, replaced with generated manifest
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient 1 balise de type Date
#    Et le fichier ATR contient 1 balise de type MessageIdentifier
#    Et le fichier ATR contient 1 balise de type ArchivalAgreement
#    Et le fichier ATR contient 1 balise de type DataObjectPackage
#    Et le fichier ATR contient 1 balise de type ManagementMetadata
#    Et le fichier ATR contient 1 balise de type Operation
#    Et le fichier ATR contient 4 balises de type Event
#    Et le fichier ATR contient 4 balises de type EventTypeCode
#    Et le fichier ATR contient 4 balises de type EventType
#    Et le fichier ATR contient 4 balises de type EventDateTime
#    Et le fichier ATR contient 4 balises de type Outcome
#    Et le fichier ATR contient 4 balises de type OutcomeDetail
#    Et le fichier ATR contient 4 balises de type OutcomeDetailMessage
#    Et le fichier ATR contient 1 balises de type DescriptiveMetadata
#    Et le fichier ATR contient 1 balises de type ArchiveUnit
#    Et le fichier ATR contient 1 balises de type SystemId
#    Et le fichier ATR contient 1 balises de type DataObjectGroup
#    Et le fichier ATR contient 1 balises de type BinaryDataObject
#    Et le fichier ATR contient 1 balises de type DataObjectSystemId
#    Et le fichier ATR contient 1 balises de type DataObjectGroupSystemId
#    Et le fichier ATR contient 1 balises de type ReplyCode
#    Et le fichier ATR contient 1 balises de type MessageRequestIdentifier
#    Et le fichier ATR contient 1 balises de type GrantDate
#    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, CHECK_DIGEST, LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK
#    Et le fichier ATR contient la  chaîne de caractères
#  """
#  <BinaryDataObject id="ID018">
#  """
#    Et le fichier ATR contient la  chaîne de caractères
#  """
#  <ArchiveUnit id="ID019">
#  """

  Scénario: Import dans collect d'un SIP avec empreinte vide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/DIGEST_VIDE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
#    # FIXME : No ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, CHECK_DIGEST, LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK

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
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est WARNING
#    # FIXME : NO LFC
#    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Historique de la station Gambetta
#    Alors les statuts des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est WARNING
#    # Il y a 1 occurrence de ces événements

  Scénario: Import dans collect d'un SIP avec PUID incohérents
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_WARNING/ZIP/WARNING_FORMT_PUID-incoherent.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est WARNING
#    # FIXME : NO LFC
#    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Recommandation de 2012 du CCSDS for Space Data System Practices - Reference Model for an Open Archival Information System (OAIS)
#    Alors les statuts des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est WARNING
#    # Il y a 2 occurrences de ces événements en warning et 1 en ok


### KO

  Scénario: Import dans collect d'un SIP avec format inconnu
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_FORMT_INCONNU.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    # FIXME : NO LFC
#    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT.UNKNOWN
#    Et le fichier ATR contient 10 balises de type Event

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
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT.UNCHARTED
#    Et le fichier ATR contient 4 balises de type Event

  Scénario: Cleanup (finally) : Reset référentiel PRONOM
    Etant donné les tests effectués sur le tenant 1
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V109.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |
    Etant donné les tests effectués sur le tenant 0
