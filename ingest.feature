# language: fr

@Ingest
Fonctionnalité: uploader des fichiers SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  # Je m'assure que les contracts d'entrée sont bient importés
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test des différentes étapes OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_SANITY_CHECK_SIP, CHECK_SEDA, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST, STP_UNIT_CHECK_AND_PROCESS, STP_STORAGE_AVAILABILITY_CHECK, OG_METADATA_INDEXATION, STP_UPDATE_OBJECT_GROUP, OBJ_STORAGE, STP_INGEST_FINALISATION, ATR_NOTIFICATION, ACCESSION_REGISTRATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Archive Unit déclare fils avant père
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_desunitsdeclare_1unitfilsavantpere.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OBJ_STORING, STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Title en alphabets différents
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_test_differentes_langues.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Arborescence rateau
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST, STP_INGEST_CONTROL_SIP, STP_UNIT_METADATA, STP_UNIT_STORING, OBJ_STORAGE sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Objet sans GOT
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MANIFESTE-OBJET-SANS-GOT.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements OG_METADATA_INDEXATION, STP_OBJ_STORING, STP_OG_STORING, UNIT_METADATA_INDEXATION, STP_UNIT_STORING sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Enregistrement d'une archive physique
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_SANITY_CHECK_SIP, CHECK_SEDA, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST, STP_OBJ_STORING, STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: SIP au format TAR
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: SIP au format TAR GZ
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar.gz
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: SIP au format TAR BZ2
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar.bz2
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Test de l'indexation d'une arborescence complexe
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OBJ_STORING, STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Test de l'indexation d'une archive ayant une description multi-valuée
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP-multivalue.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OBJ_STORING, STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: SIP avec empreinte KO - Retour ATR doit être OK
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_Empreinte_test_ATR.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_FINALISATION, ATR_NOTIFICATION sont OK

  Scénario: Test SIP avec metadonnees libres complexes
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

  Scénario: Test SIP - Manifest avec un maximum de métadonnées
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/all-metadata.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME, PROCESS_SIP_UNITARY sont WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING

  Scénario: Test SIP - Size of binary Object Incorrect
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/sip_incorrect_size.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements CHECK_SIZE, STP_OG_CHECK_AND_TRANSFORME sont WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING

  Scénario: Test SIP - Size of binary Object Missed
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/sip_missed_size.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements CHECK_SIZE, STP_OG_CHECK_AND_TRANSFORME sont WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING