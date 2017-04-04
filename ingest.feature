# language: fr

@Ingest
Fonctionnalité: uploader des fichier SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Test des différentes étapes OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements PROCESS_SIP_UNITARY, STP_SANITY_CHECK_SIP, CHECK_SEDA, CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_MANIFEST_OBJECTNUMBER, CHECK_MANIFEST, STP_UNIT_CHECK_AND_PROCESS, STP_STORAGE_AVAILABILITY_CHECK, OG_METADATA_INDEXATION, OG_STORAGE, STP_INGEST_FINALISATION, ATR_NOTIFICATION, ACCESSION_REGISTRATION sont OK

  Scénario: SIP au mauvais format
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_Mauvais_Format.pdf
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO

  Scénario: Archive Unit déclare fils avant père
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_desunitsdeclare_1unitfilsavantpere.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK

  Scénario: Test virus
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement SANITY_CHECK_SIP est KO

  Scénario: Title en alphabets différents
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_test_differentes_langues.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK

  Scénario: Bordereau mauvais format
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_mauvais_format.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Arborescence rateau
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_MANIFEST, STP_INGEST_CONTROL_SIP, STP_UNIT_STORING, OG_STORAGE sont OK

  Scénario: Test SEDA
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_non_conforme_seda.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Nombre d'objets supérieurs à celui déclaré dans le bordereau
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OBJT_nombresup_SEDA.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_MANIFEST_OBJECTNUMBER est KO

  Scénario: Empreinte invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_empreinte_KO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DIGEST, STP_OG_CHECK_AND_TRANSFORME sont KO

  Scénario: Test orphelin
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OBJT_orphelins.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_CONSISTENCY est KO

  Scénario: Bordereau absent
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_absent.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO

  Scénario: Contrôle sur une empreinte SHA-512
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_EMPRT_SHA256_2.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_DIGEST est OK

  Scénario: Format inconnnu
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_FORMT_INCONNU.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME sont KO

  Scénario: Contrôles sur les formats
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMAT_Varies.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements OG_OBJECTS_FORMAT_CHECK, STP_OG_CHECK_AND_TRANSFORME, PROCESS_SIP_UNITARY sont WARNING

  Scénario: Objet sans GOT
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MANIFESTE-OBJET-SANS-GOT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements OG_METADATA_INDEXATION, STP_OG_STORING, UNIT_METADATA_INDEXATION, STP_UNIT_STORING sont OK

  Scénario: Registre des fonds absent
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_REGISTRE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_ACCESSION_REGISTRATION, ACCESSION_REGISTRATION sont KO

  Scénario: Règle inconnue
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO-RULES.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_UNIT_CHECK_AND_PROCESS, UNITS_RULES_COMPUTE sont KO

  Scénario: Règel de gestion OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK-RULES.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_UNIT_CHECK_AND_PROCESS, UNITS_RULES_COMPUTE sont OK

  Scénario: URI mal déclarées
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_MANIFESTE-URI.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_MANIFEST_OBJECTNUMBER sont KO

  Scénario: Objets déclarés absents
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OBJET-NOMBRE-INFERIEUR.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_MANIFEST_OBJECTNUMBER sont KO

  Scénario: XML invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_xmlKO_sansobjet.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_SEDA sont KO

  Scénario: SIP sans objet
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_sans_objet.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING
    Et le statut de l'événement STP_OG_CHECK_AND_TRANSFORME est WARNING
    Et le statut de l'événement CHECK_MANIFEST_OBJECTNUMBER est OK

  Scénario: Enregistrement d'une archive physique
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements PROCESS_SIP_UNITARY, STP_SANITY_CHECK_SIP, CHECK_SEDA, CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_MANIFEST_OBJECTNUMBER, CHECK_MANIFEST, STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK

  Scénario: Test PUID incohérents
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_FORMT_PUID-incoherent.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont WARNING

  Scénario: Archive unit récursive
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_ARBO_recursif.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_MANIFEST est KO

  Scénario: SIP au format TAR
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK

  Scénario: SIP au format TAR GZ
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar.gz
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK

  Scénario: SIP au format TAR BZ2
    Etant donné un fichier SIP nommé data/SIP_OK/TAR/OK_SIP_2_GO.tar.bz2
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_CONTAINER est OK

  Scénario: SIP avec une empreinte MD5
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP-test-md5.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement CHECK_DIGEST est OK

  Scénario: test sur le RULES_Compute pour un SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-regles-communes-MM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines non dotées de règles, mais avec un ManagementMetadata doté de règles
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-regle-MM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines dotées de règles, mais avec un ManagementMetadata sans règle
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-pas-de-regle-MM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata qui partage la même règle que le ManagementMetadata mais avec des StartDate différentes
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-regle-commune-AU-racinne-MM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata sans règle, mais avec des règles définies au niveau du bloc ManagementMetadata
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-MM-pas-de-regle-AU-racine.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata, sans qu'aucune règle ne soit définie au niveau du bloc ManagementMetadata
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-AU-racine-pas-de-regle-MM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui n'est pas à la racine du bloc DescriptiveMetadata
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES-AU_non-racine.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: SIP KO sur la tâche RULES_COMPUTE
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_RULES_regle-incoherente-categorie.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO

  Scénario: SIP KO sur les versions déclarées
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_mauvaise-version.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Test de l'indexation d'une arborescence complexe
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK

  Scénario: Test de l'indexation d'une archive ayant une description multi-valuée
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP-multivalue.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_STORING, OG_METADATA_INDEXATION, STP_UNIT_STORING, UNIT_METADATA_INDEXATION sont OK

  Scénario: Manifest avec deux objets qui déclarent le GO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_2_OBJT_declarent_le_GO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO

  Scénario: SIP avec un fichier sans extension
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_FILES_sans_extention.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK

  Scénario: SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2RACINES_AVEC_MANAGEMENTMETADATA.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK

  Scénario: SIP avec un fichier dont l'extension contient un caractère spécial
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_FILE_extension_caractere_special.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OG_CHECK_AND_TRANSFORME, OG_OBJECTS_FORMAT_CHECK sont OK

  Scénario: SIP contenant un groupe d'objet sans unit
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_GROUPE_OBJET_SANS_UNIT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_CONSISTENCY, STP_INGEST_CONTROL_SIP sont KO

  Scénario: SIP avec empreinte KO - Retour ATR doit être OK
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_Empreinte_test_ATR.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_FINALISATION, ATR_NOTIFICATION sont OK

  Scénario: SIP avec Règle de gestion d'une durée de 999 ans
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_RULE_999_ans.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement UNITS_RULES_COMPUTE est KO

  Scénario: SIP avec un Binary Master
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_USAGE_1_BM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_MANIFEST sont OK

  Scénario: SIP avec des usages sans numéros
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_USAGE_SANS_NUMERO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_MANIFEST sont OK

  Scénario: Manifest avec deux Binary Master
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_USAGES_2_BM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_MANIFEST est KO

  Scénario: Manifest contenant plus de 900 AU
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_900_AU.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et le statut de l'événement PROCESS_SIP_UNITARY est OK

  Scénario: SIP FATAL
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_FATAL.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est FATAL
    Et les statuts des événements STP_INGEST_FINALISATION, ATR_NOTIFICATION sont OK

  Scénario: test multi répertoire Content in SIP
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_DEUX_Contents.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO

  Scénario: test multi manifest in SIP
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_DEUX-Manifest.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO

  Scénario: test reject SIP unit declare Binary Data Object reference to OG
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_1986_unit_declare_IDobjet_au_lieu_IDGOT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_MANIFEST, STP_INGEST_CONTROL_SIP sont KO
