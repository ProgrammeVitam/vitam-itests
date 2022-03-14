# language: fr

@Audit
@ProbativeValueAudit
Fonctionnalité: Audit de valeur probante
    Contexte: Avant de lancer cette suite de test, je présuppose que un contrat d'accès est chargé.
        Etant donné les tests effectués sur le tenant 0
        Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
        Et le contract contrat_EveryOriginatingAgency_true de type ACCESS_CONTRACTS définie dans le fichier data/contracts/contract_access_every_originating_agency.json
        Et le contract ArchivalAgreement0 de type INGEST_CONTRACTS définie dans le fichier data/contracts/referential_contracts_ok.json


    Scénario: Cas OK
        Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
        Et que l'ingest date d'au moins 300 secondes
        Et je nomme l'identifiant de l'opération IngestOperationId
        Quand je génère un journal des opérations sécurisé
        Et je génère un journal des cycles de vie des unités archivistiques sécurisé
        Et je génère un journal des cycles de vie des groupes d'objets sécurisé
        Et j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$eq": { "#opi": "Named-Operation-Id<IngestOperationId>" } }
  ],
  "$projection": { }
}
"""
        Et Je lance un rélevé de valeur probante avec l'usage suivant BinaryMaster
        Et je recherche le journal des opérations
        Alors le statut final du journal des opérations est OK
        Et l'outcome détail de l'événement EXPORT_PROBATIVE_VALUE est EXPORT_PROBATIVE_VALUE.OK


    Scénario: Cas KO ($threshold = 0)
        Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
        Et que l'ingest date d'au moins 300 secondes
        Et je nomme l'identifiant de l'opération IngestOperationId
        Quand je génère un journal des opérations sécurisé
        Et je génère un journal des cycles de vie des unités archivistiques sécurisé
        Et je génère un journal des cycles de vie des groupes d'objets sécurisé
        Et j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$eq": { "#opi": "Named-Operation-Id<IngestOperationId>" } }
  ],
  "$projection": {},
  "$threshold": 0
}
"""
        Et Je lance un rélevé de valeur probante avec l'usage suivant BinaryMaster
        Et je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement EXPORT_PROBATIVE_VALUE est EXPORT_PROBATIVE_VALUE.KO


    Scénario: Test d'audit sans sécurisation
    # Audit without traceability (forced new ingest)
        Etant donné un fichier SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
        Quand je télécharge le SIP
        Et je recherche le journal des opérations
        Alors le statut final du journal des opérations est OK
        Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$eq": { "#opi": "Operation-Id" } }
  ],
  "$projection": { }
}
"""
        Et Je lance un rélevé de valeur probante avec l'usage suivant BinaryMaster
        Et je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement EXPORT_PROBATIVE_VALUE est EXPORT_PROBATIVE_VALUE.KO