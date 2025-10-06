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

##### CHECK_SEDA.CONTAINER_FORMAT #####

# FIXME: "Content" folder is hardcoded
#  Scénario: Import dans collect d'un SIP avec multi répertoire Content
#    Quand j'initialise une transaction
#    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_DEUX_Contents.zip
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est KO
#    Et le statut de l'événement CHECK_SEDA est KO
#    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.CONTAINER_FORMAT.DIRECTORY.KO

# FIXME : Manifest check and unicity not implemented
#  Scénario: Import dans collect d'un SIP multi manifest
#    Quand j'initialise une transaction
#    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_DEUX-Manifest.zip
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est KO
#    Et le statut de l'événement CHECK_SEDA est KO
#    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.CONTAINER_FORMAT.FILE.KO

##### CHECK_SEDA.NO_FILE #####

  Scénario: Import dans collect d'un SIP avec bordereau mauvais format
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_mauvais_format.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XML_FILE.KO

# FIXME : Manifest check and unicity not implemented
#  Scénario: Import dans collect d'un SIP avec bordereau absent
#    Quand j'initialise une transaction
#    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_absent.zip
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est KO
#    Et le statut de l'événement MANIFEST_FILE_NAME_CHECK est KO
#    Et l'outcome détail de l'événement MANIFEST_FILE_NAME_CHECK est MANIFEST_FILE_NAME_CHECK.KO

##### CHECK_SEDA.NOT_XML_FILE #####

  Scénario: Import dans collect d'un SIP avec XML invalide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_xmlKO_sansobjet.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_SEDA sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XML_FILE.KO

##### CHECK_SEDA.NOT_XSD_VALID #####

  Scénario: Import dans collect d'un SIP avec manifest non conforme SEDA
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_non_conforme_seda.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_UNIT_SCHEMA, STP_UNIT_CHECK_AND_PROCESS sont KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO

  Scénario: Import dans collect d'un SIP avec manifest avec deux objets qui déclarent le GO
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_2_OBJT_declarent_le_GO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO

  Scénario: Import dans collect d'un SIP avec objet physique KO SEDA (US 2216)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_2216_CA2_non_conforme_SEDA.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO

  Scénario: Import dans collect d'un SIP avec un GOT vide (US 2216)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_AU_GOT_VIDE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO
