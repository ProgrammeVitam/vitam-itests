# language: fr

@Ingest_CHECK_DATAOBJECTPACKAGE
Fonctionnalité: uploader des fichier SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  # Je m'assure que les contracts d'entrée sont bient importés
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

##### CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION #####

### OK

  Scénario: SIP avec un Binary Master
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_USAGE_1_BM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est ArchiveUnit Contenant un BinaryMaster et un\n                        TextContent
    Alors le statuts de JCV de l'événement LFC.CHECK_MANIFEST est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK


  Scénario: SIP avec des usages sans numéros
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_USAGE_SANS_NUMERO.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont OK
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est ArchiveUnit Contenant un BinaryMaster et un\n                        TextContent
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK

### KO

  Scénario: SIP KO sur les versions déclarées
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BORD_mauvaise-version.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Test SIP with invalid version on physical object KO (US 2216)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_2216_CA3_Usages_invalide.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.BDO_DATAOBJECTIONVERSION_PHYSICALMASTER.KO

  Scénario: Test SIP (#3335)  - Manifest déclare un BinaryMaster dans un Objet physique
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_BinaryInPhysical.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.PDO_DATAOBJECTIONVERSION_BINARYMASTER.KO

  Scénario: Test SIP (#3335)  - Manifest déclare un PhysicalMaster dans un Objet binaire
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_PhysicalInBinary.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.BDO_DATAOBJECTIONVERSION_PHYSICALMASTER.KO

  Scénario: Test SIP (#3335)  - Manifest déclare un mauvais DataObjectVersion (BinaryMaster_One)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_WRONG_USAGE_VERSION.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.INVALID_DATAOBJECTVERSION.KO

  Scénario: Test SIP (#3335)  - Manifest déclare une URI vide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_EmptyUri.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.EMPTY_REQUIRED_FIELD.KO

  Scénario: Test SIP (#3335)  - Manifest déclare un PhysicalId vide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_EmptyPhysicalId.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.EMPTY_REQUIRED_FIELD.KO

##### CHECK_MANIFEST_OBJECTNUMBER #####

  Scénario: SIP sans objet
    Etant donné un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_sans_objet.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING
    Et le statut de l'événement STP_OG_CHECK_AND_TRANSFORME est WARNING
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est OK

  Scénario: URI mal déclarées
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_MANIFESTE-URI.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.INVALID_URI.KO

  Scénario: Test SIP (#3335)  - AU déclare un Objet à la place du GOT
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_INVALID_URI.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.INVALID_URI.KO

  Scénario: Test SIP (#3335)  - Manifest déclare moins d'objets binaires que dans le folder content
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_INFERIOR_BDO.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.MANIFEST_INFERIOR_BDO.KO

  Scénario: Test SIP (#3335)  - Manifest déclare plus d'objets binaires que dans le folder content
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SUPERIOR_BDO.zip
    Quand je télécharge le SIP
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.MANIFEST_SUPERIOR_BDO.KO

##### CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST #####

  Scénario: Manifest avec deux Binary Master
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_USAGES_2_BM.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est KO

  Scénario: test reject SIP unit declare Binary Data Object reference to OG
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_SIP_1986_unit_declare_IDobjet_au_lieu_IDGOT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.EXISTING_OG_NOT_DECLARED.KO

  Scénario: Test SIP avec cycle KO (US 2754)
    Etant donné les tests effectués sur le tenant 0
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_CYCLE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_LOOP.KO

  Scénario: Test SIP avec AU rattachement KO (US 2754)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_WRONG_ATTACHMENT_AU.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_WRONG_ATTACHMENT.KO

  Scénario: Test SIP avec GOT rattachement KO (US 2754)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_WRONG_ATTACHMENT_GOT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_WRONG_ATTACHMENT.KO

##### CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY #####

  Scénario: Test orphelin
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_OBJT_orphelins.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY sont KO

  Scénario: Test SIP with invalid orphan GOT on physical object KO (US 2216)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_2216_CA4_GOT_orphelin.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY est KO
