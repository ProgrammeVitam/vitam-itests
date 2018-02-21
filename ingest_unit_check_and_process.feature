# language: fr

@Ingest_UNIT_CHECK_AND_PROCESS
Fonctionnalité: uploader des fichiers SIP - UNIT_CHECK_AND_PROCESS
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_UNIT_SCHEMA #####

### KO

  Scénario: Test SIP ayant un titre vide  (US 1791)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_1791_SIP_TITLE_VIDE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.EMPTY_REQUIRED_FIELD.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.EMPTY_REQUIRED_FIELD.KO

  Scénario: Test SIP avec date invalide KO (US 1791)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_Endate_anterieur_Started.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.INVALID_UNIT.KO

  Scénario: Test SIP with invalid date KO (US 1791)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_1791_SIP_RG-STARTDATE_AN9000.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.RULE_DATE_FORMAT.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_UNIT_SCHEMA.KO, CHECK_UNIT_SCHEMA.RULE_DATE_FORMAT.KO

##### UNITS_RULES_COMPUTE #####

### OK

  Scénario: test sur le RULES_Compute pour un SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-regles-communes-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 2 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK

  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines non dotées de règles, mais avec un ManagementMetadata doté de règles
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 2 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit racines dotées de règles, mais avec un ManagementMetadata sans règle
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-racines-multiples-pas-de-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 2 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata qui partage la même règle que le ManagementMetadata mais avec des StartDate différentes
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-regle-commune-AU-racinne-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 5 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata sans règle, mais avec des règles définies au niveau du bloc ManagementMetadata
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-MM-pas-de-regle-AU-racine.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 5 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui est à la racine de DescriptiveMetadata, sans qu'aucune règle ne soit définie au niveau du bloc ManagementMetadata
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-AU-racine-pas-de-regle-MM.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 5 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: test sur le RULES_Compute pour une ArchiveUnit qui n'est pas à la racine du bloc DescriptiveMetadata
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES-AU_non-racine.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 5 unités archivistiques
    Et le fichier ATR contient 2 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est Oxford Street
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


  Scénario: SIP dont la règle de gestion du bloc ManagementMetadata s'applique aux deux racines
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_2RACINES_AVEC_MANAGEMENTMETADATA.zip
    Quand je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont OK
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.OK
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 7 unités archivistiques
    Et le fichier ATR contient 1 objets binaires
    Quand je recherche le JCV de l'unité archivistique dont le titre est AU1 Racine002
    Alors les statuts des événements LFC.CHECK_MANIFEST, LFC.CHECK_MANIFEST.LFC_CREATION, LFC.CHECK_UNIT_SCHEMA, LFC.UNITS_RULES_COMPUTE, LFC.UNIT_METADATA_INDEXATION sont OK


### KO

  Scénario: Règle inconnue
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO-RULES.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.UNKNOWN.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Et l'outcome détail de l'événement PROCESS_SIP_UNITARY est PROCESS_SIP_UNITARY.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.UNKNOWN.KO

  Scénario: SIP KO sur la tâche RULES_COMPUTE pour une catégorie de règle déclarant un identifiant de règle d'une autre catégorie
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_RULES_regle-incoherente-categorie.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.UNKNOWN.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.UNKNOWN.KO

  Scénario: SIP avec une catégorie de règle ayant un refNonRuleId déclarant un id de règle n'étant pas de la même catégorie
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_RefNonRuleId_ayant_un_ID_de_regle_dune_autre_categorie_que_la_sienne.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements UNITS_RULES_COMPUTE, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement UNITS_RULES_COMPUTE est UNITS_RULES_COMPUTE.REF_INCONSISTENCY.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, UNITS_RULES_COMPUTE.KO, UNITS_RULES_COMPUTE.REF_INCONSISTENCY.KO

  Scénario: SIP avec classification level KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_Classification_Level_Wrong.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_CLASSIFICATION_LEVEL, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_CLASSIFICATION_LEVEL est CHECK_CLASSIFICATION_LEVEL.KO
    Et l'outcome détail de l'événement STP_UNIT_CHECK_AND_PROCESS est STP_UNIT_CHECK_AND_PROCESS.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient les valeurs STP_UNIT_CHECK_AND_PROCESS.KO, CHECK_CLASSIFICATION_LEVEL.KO, LFC.CHECK_CLASSIFICATION_LEVEL.KO
