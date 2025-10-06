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

  @Light
  Scénario: Import dans collect d'un SIP avec un Binary Master
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_USAGE_1_BM.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont OK
    # FIXME : No LFC

  Scénario: Import dans collect d'un SIP avec des usages sans numéros
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_USAGE_SANS_NUMERO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont OK
    # FIXME : No ATR / LFC

  Scénario: Import dans collect d'un SIP avec mauvaises versions déclarées
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BORD_mauvaise-version.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Import dans collect d'un SIP KO déclarant un usage avec un tiret
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_USAGE_VERSION_TIRET.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Import dans collect d'un SIP KO déclarant un usage et une version non séparés par un underscore
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_VERSION_USAGE_VERSION_ATTACHES.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO

  Scénario: Import dans collect d'un SIP avec une version invalide d'un Physical Object KO
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_2216_CA3_Usages_invalide.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est KO

  Scénario: Import dans collect d'un SIP déclarant un BinaryMaster dans un Objet physique
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_BinaryInPhysical.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.PDO_DATAOBJECTIONVERSION_BINARYMASTER.KO

  Scénario: Import dans collect d'un SIP déclarant un PhysicalMaster dans un Objet binaire
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_PhysicalInBinary.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.BDO_DATAOBJECTIONVERSION_PHYSICALMASTER.KO

  Scénario: Import dans collect d'un SIP déclarant un mauvais DataObjectVersion (BinaryMaster_One)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_WRONG_USAGE_VERSION.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.INVALID_DATAOBJECTVERSION.KO

  Scénario: Import dans collect d'un SIP déclarant un numéro de version écrit en lettres
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_VERSION_LETTRES.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.INVALID_DATAOBJECTVERSION.KO

  Scénario: Import dans collect d'un SIP déclarant un numéro de version ayant une virgule
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_VERSION_VIRGULE.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.INVALID_DATAOBJECTVERSION.KO

  Scénario: Import dans collect d'un SIP déclarant une URI vide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_EmptyUri.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.EMPTY_REQUIRED_FIELD.KO

  Scénario: Import dans collect d'un SIP déclarant un PhysicalId vide
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_EmptyPhysicalId.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_DATAOBJECT_VERSION.EMPTY_REQUIRED_FIELD.KO

##### CHECK_MANIFEST_OBJECTNUMBER #####

  Scénario: Import dans collect d'un SIP sans objet
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_WARNING/ZIP/WARNING_SIP_sans_objet.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et le statut de l'événement STP_OG_CHECK_AND_TRANSFORME est WARNING
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est OK

  Scénario: Import dans collect d'un SIP avec URIs mal déclarées
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_MANIFESTE-URI.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements STP_INGEST_CONTROL_SIP, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.INVALID_URI.KO

  Scénario: Import dans collect d'un SIP avec AU qui déclare un Objet à la place du GOT
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_INVALID_URI.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.INVALID_URI.KO

  Scénario: Import dans collect d'un SIP qui déclare moins d'objets binaires que dans le folder content
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_INFERIOR_BDO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.MANIFEST_INFERIOR_BDO.KO

  Scénario: Import dans collect d'un SIP qui déclare plus d'objets binaires que dans le folder content
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SUPERIOR_BDO.zip
    Et je recherche le journal des opérations
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_OBJECTNUMBER.MANIFEST_SUPERIOR_BDO.KO

##### CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST #####
  
  Scénario: Import dans collect d'un SIP avec deux Binary Master
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_USAGES_2_BM.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est KO

  Scénario: Import dans collect d'un SIP avec Binary Data Object qui réference un GOT
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SIP_1986_unit_declare_IDobjet_au_lieu_IDGOT.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST, STP_INGEST_CONTROL_SIP sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.EXISTING_OG_NOT_DECLARED.KO
  
  Scénario: Import dans collect d'un SIP avec cycle KO (US 2754)
    Etant donné les tests effectués sur le tenant 0
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_CYCLE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_LOOP.KO

  Scénario: Import dans collect d'un SIP avec AU rattachement KO (US 2754)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_WRONG_ATTACHMENT_AU.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.NOT_FOUND_ATTACHMENT.KO

  # FIXME: Attachement
  ##### Attach AU to existing GOT #####
  # Scénario: Rattachement d'une unité archivistique de sip à un groupe d'objet existant OK
  # Scénario: Test SIP avec GOT rattachement KO (US 2754)
  # Scénario: Test SIP avec SystemID n'étant pas un GUID

##### CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY #####

  Scénario: Import dans collect d'un SIP avec object orphelin
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_OBJT_orphelins.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY sont KO

  Scénario: Import dans collect d'un SIP avec GOT orphelin GOT avec objet physique KO (US 2216)
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_2216_CA4_GOT_orphelin.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_CONSISTENCY est KO
