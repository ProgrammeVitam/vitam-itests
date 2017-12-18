# language: fr

@Ingest_OG_CHECK_AND_TRANSFORME
Fonctionnalité: uploader des fichiers SIP - OG_CHECK_AND_TRANSFORME
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
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Sensibilisation API
    Alors les statuts de JCV des événements LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK est OK
    # Il y a 4 occurences de ces événements

  Scénario: Contrôle sur une empreinte SHA-512
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_EMPRT_SHA256_2.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont OK
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est la nouvelle newsletter de vitam
    Alors les statuts de JCV des événements LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK est OK
    # Il y a 1 occurence de ces événements

  Scénario: SIP avec un fichier sans extension
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_FILES_sans_extention.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.OK
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Integer rutrum condimentum
    Alors les statuts de JCV des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est OK
    # Il y a 1 occurence de ces événements

### KO

  Scénario: Empreinte invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_empreinte_KO.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient 1 balise de type Date
    Et le fichier ATR contient 1 balise de type MessageIdentifier
    Et le fichier ATR contient 1 balise de type ArchivalAgreement
    Et le fichier ATR contient 1 balise de type DataObjectPackage
    Et le fichier ATR contient 1 balise de type ManagementMetadata
    Et le fichier ATR contient 1 balise de type ReplyOutcome
    Et le fichier ATR contient 1 balise de type Operation
    Et le fichier ATR contient 4 balises de type Event
    Et le fichier ATR contient 4 balises de type EventTypeCode
    Et le fichier ATR contient 4 balises de type EventType
    Et le fichier ATR contient 4 balises de type EventDateTime
    Et le fichier ATR contient 4 balises de type Outcome
    Et le fichier ATR contient 4 balises de type OutcomeDetail
    Et le fichier ATR contient 4 balises de type OutcomeDetailMessage
    Et le fichier ATR contient 1 balises de type ArchiveUnitList
    Et le fichier ATR contient 1 balises de type ArchiveUnit
    Et le fichier ATR contient 1 balises de type SystemId
    Et le fichier ATR contient 1 balises de type DataObjectList
    Et le fichier ATR contient 1 balises de type DataObjectGroup
    Et le fichier ATR contient 1 balises de type BinaryDataObject
    Et le fichier ATR contient 1 balises de type DataObjectSystemId
    Et le fichier ATR contient 1 balises de type DataObjectGroupSystemId
    Et le fichier ATR contient 1 balises de type ReplyCode
    Et le fichier ATR contient 1 balises de type MessageRequestIdentifier
    Et le fichier ATR contient 1 balises de type GrantDate
    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, CHECK_DIGEST, LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK
    Et le fichier ATR contient la  chaîne de caractères
  """
  <BinaryDataObject id="ID018">
  """
    Et le fichier ATR contient la  chaîne de caractères
  """
  <ArchiveUnit id="ID019">
  """

  Scénario: Empreinte vide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/DIGEST_VIDE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, CHECK_DIGEST, LFC.CHECK_DIGEST, LFC.CHECK_DIGEST.CALC_CHECK

##### OG_OBJECTS_FORMAT_CHECK

### WARNING

  Scénario: Contrôles sur les formats
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMAT_Varies.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Integer rutrum condimentum
    Alors les statuts de JCV des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est WARNING
    # Il y a 1 occurence de ces événements

  Scénario: Test PUID incohérents
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMT_PUID-incoherent.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont WARNING
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.WARNING
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Integer rutrum condimentum
    Alors les statuts de JCV des événements LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT,LFC.OG_OBJECTS_FORMAT_CHECK est WARNING
    # Il y a 2 occurences de ces événements en warning et 1 en ok


### KO

  Scénario: Format inconnnu
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_FORMT_INCONNU.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO
    Et l'outcome détail de l'événement OG_OBJECTS_FORMAT_CHECK est OG_OBJECTS_FORMAT_CHECK.KO
    Et l'outcome détail de l'événement STP_OG_CHECK_AND_TRANSFORME est STP_OG_CHECK_AND_TRANSFORME.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK, LFC.OG_OBJECTS_FORMAT_CHECK.FILE_FORMAT.UNKNOWN
    Et le fichier ATR contient 4 balises de type Event
