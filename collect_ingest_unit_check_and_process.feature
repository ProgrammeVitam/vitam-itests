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

##### CHECK_UNIT_SCHEMA #####

### KO

  Scénario: Import dans collect d'un SIP ayant un titre vide  (US 1791)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_1791_SIP_TITLE_VIDE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.INVALID_UNIT.KO

  Scénario: Import dans collect d'un SIP avec date invalide KO (US 1791)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_Endate_anterieur_Started.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.CONSISTENCY.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.CONSISTENCY.KO

  Scénario: Import dans collect d'un SIP with invalid date KO (US 1791)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_1791_SIP_RG-STARTDATE_AN9000.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.INVALID_UNIT.KO

##### UNITS_RULES_COMPUTE #####

### OK

  Scénario: test sur le RULES_Compute pour un SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-racines-multiples-regles-communes-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 2 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 2 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines non dotées de règles, mais avec un ManagementMetadata doté de règles
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-racines-multiples-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 2 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 2 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines dotées de règles, mais avec un ManagementMetadata sans règle
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-racines-multiples-pas-de-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 2 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 2 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata qui partage la même règle que le ManagementMetadata mais avec des StartDate différentes
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-regle-commune-AU-racinne-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 5 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 5 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata sans règle, mais avec des règles définies au niveau du bloc ManagementMetadata
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-MM-pas-de-regle-AU-racine.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 5 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 5 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata, sans qu'aucune règle ne soit définie au niveau du bloc ManagementMetadata
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-AU-racine-pas-de-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 5 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 5 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui n'est pas à la racine du bloc DescriptiveMetadata
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_RULES-AU_non-racine.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 5 unités archivistiques
#    Et le fichier ATR contient 2 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 5 unités archivistiques
    Et le manifest généré de la transaction contient 2 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP_2RACINES_AVEC_MANAGEMENTMETADATA.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK
#    Et le fichier ATR contient 7 unités archivistiques
#    Et le fichier ATR contient 1 objets binaires
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 7 unités archivistiques
    Et le manifest généré de la transaction contient 1 objets binaires
#    # FIXME : NO LFC
#    Quand je recherche le JCV de l'unité archivistique dont le titre est AU1 Racine002
#    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


### KO

  Scénario: Règle inconnue
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO-RULES.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.UNKNOWN.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Et l'outcome détail de l'événement COLLECT_SIP_INGEST est COLLECT_SIP_INGEST.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.UNKNOWN.KO

  Scénario: SIP KO sur la tâche RULES_COMPUTE pour une catégorie de règle déclarant un identifiant de règle d'une autre catégorie
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_RULES_regle-incoherente-categorie.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.CONSISTENCY.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.CONSISTENCY.KO

  Scénario: SIP avec une catégorie de règle ayant un refNonRuleId déclarant un id de règle n'étant pas de la même catégorie
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_RefNonRuleId_ayant_un_ID_de_regle_dune_autre_categorie_que_la_sienne.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.REF_INCONSISTENCY.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.REF_INCONSISTENCY.KO

  Scénario: SIP avec classification level KO
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SIP_Classification_Level_Wrong.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_CLASSIFICATION_LEVEL, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_CLASSIFICATION_LEVEL est CHECK_CLASSIFICATION_LEVEL.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_CLASSIFICATION_LEVEL.KO, LFC.CHECK_CLASSIFICATION_LEVEL.KO


    ##### CHECK_ARCHIVE_UNIT_PROFILE #####

### OK

  Scénario: Import dans collect d'un SIP ayant un document type (archive unit profile)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_AU_with_archive_unit_profile.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_ARCHIVE_UNIT_PROFILE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement CHECK_ARCHIVE_UNIT_PROFILE est CHECK_ARCHIVE_UNIT_PROFILE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est OK

### KO

  Scénario: Import dans collect d'un SIP ayant un document type non existant
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_AU_with_wrong_archive_unit_profile.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_ARCHIVE_UNIT_PROFILE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_ARCHIVE_UNIT_PROFILE est CHECK_ARCHIVE_UNIT_PROFILE.NOT_FOUND.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_ARCHIVE_UNIT_PROFILE.KO, CHECK_ARCHIVE_UNIT_PROFILE.NOT_FOUND.KO
#    Et le fichier ATR contient la  chaîne de caractères
#"""
#"evDetTechData":"Archive Unit Profile not found"
#"""

  Scénario: Import dans collect d'un SIP ne respectant pas le schéma de son document type
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_AU_with_incorrect_AUP_Schema.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_ARCHIVE_UNIT_PROFILE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_ARCHIVE_UNIT_PROFILE est CHECK_ARCHIVE_UNIT_PROFILE.NOT_AU_JSON_VALID.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
#    # FIXME : NO ATR
#    Quand je télécharge son fichier ATR
#    Alors l'état final du fichier ATR est KO
#    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_ARCHIVE_UNIT_PROFILE.KO, CHECK_ARCHIVE_UNIT_PROFILE.NOT_AU_JSON_VALID.KO
