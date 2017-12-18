# language: fr

@Ingest_CHECK_SEDA
Fonctionnalité: uploader des fichiers SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  # Je m'assure que les contracts d'entrée sont bient importés
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_SEDA.CONTAINER_FORMAT #####

  Scénario: test multi répertoire Content in SIP
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_DEUX_Contents.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.CONTAINER_FORMAT.DIRECTORY.KO

  Scénario: test multi manifest in SIP
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_DEUX-Manifest.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.CONTAINER_FORMAT.FILE.KO
    
##### CHECK_SEDA.NO_FILE #####

  Scénario: Bordereau mauvais format
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_mauvais_format.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NO_FILE.KO

  Scénario: Bordereau absent
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_absent.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NO_FILE.KO

##### CHECK_SEDA.NOT_XML_FILE #####

  Scénario: XML invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_xmlKO_sansobjet.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_SEDA sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XML_FILE.KO

##### CHECK_SEDA.NOT_XSD_VALID #####

  Scénario: Test SEDA
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_non_conforme_seda.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO

  Scénario: Manifest avec deux objets qui déclarent le GO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_2_OBJT_declarent_le_GO.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_SEDA, STP_INGEST_CONTROL_SIP sont KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO

  Scénario: Test SIP with invalid SEDA on physical object KO (US 2216)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_2216_CA2_non_conforme_SEDA.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO

  Scénario: Test SIP AU a un GOT vide (US 2216)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_AU_GOT_VIDE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_SEDA est KO
    Et l'outcome détail de l'événement CHECK_SEDA est CHECK_SEDA.NOT_XSD_VALID.KO
