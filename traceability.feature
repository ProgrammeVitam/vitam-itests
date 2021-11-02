# language: fr

# WARNING : A preparation feature "_prepareTraceability.feature" is run in early test stages in order to have an old ingest ready for "traceability.feature" needs
# Otherwise, this test feature will need to sleep for 300s in order to have an ingest old enough for traceability.

@Traceability
Fonctionnalité: Génération journal des opérations sécurisé
	Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et le contract contrat_EveryOriginatingAgency_true de type ACCESS_CONTRACTS définie dans le fichier data/contracts/contract_access_every_originating_agency.json
    Et le contract ArchivalAgreement0 de type INGEST_CONTRACTS définie dans le fichier data/contracts/referential_contracts_ok.json

  #### Logbook operation traceability ####
  @Light
  Scénario: Sécurisation du journal d’opération OK
    Quand je génère un journal des opérations sécurisé
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OP_SECURISATION, OP_SECURISATION_TIMESTAMP, OP_SECURISATION_STORAGE sont OK
    Quand j'utilise le fichier de requête suivant data/queries/audit/check_traceability.json
    Et je lance la vérification des journaux de sécurisation
    Alors le statut final du journal des opérations est OK


  Scénario: Sécurisation du journal des cycles de vie des unités archivistiques OK
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Et que l'ingest date d'au moins 300 secondes
    Quand on lance la traçabilité des journaux de cycles de vie des unités archivistiques
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et l'outcome détail de l'événement LOGBOOK_UNIT_LFC_TRACEABILITY est LOGBOOK_UNIT_LFC_TRACEABILITY.OK
    Quand j'utilise le fichier de requête suivant data/queries/audit/check_traceability.json
    Et je lance la vérification des journaux de sécurisation
    Alors le statut final du journal des opérations est OK

  Scénario: Sécurisation du journal des cycles de vie des groupes d'objets OK
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Et que l'ingest date d'au moins 300 secondes
    Quand on lance la traçabilité des journaux de cycles de vie des groupes d'objets
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et l'outcome détail de l'événement LOGBOOK_OBJECTGROUP_LFC_TRACEABILITY est LOGBOOK_OBJECTGROUP_LFC_TRACEABILITY.OK
    Quand j'utilise le fichier de requête suivant data/queries/audit/check_traceability.json
    Et je lance la vérification des journaux de sécurisation
    Alors le statut final du journal des opérations est OK




