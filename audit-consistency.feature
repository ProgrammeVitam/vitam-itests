# language: fr

@Audit
@ConsistencyAudit
Fonctionnalité: Audit de Cohérence
  Contexte: Avant de lancer cette suite de test, je présuppose que un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et le contract contrat_EveryOriginatingAgency_true de type ACCESS_CONTRACTS définie dans le fichier data/contracts/contract_access_every_originating_agency.json
    Et le contract ArchivalAgreement0 de type INGEST_CONTRACTS définie dans le fichier data/contracts/referential_contracts_ok.json


  Scénario: Cas OK
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
    Et que l'ingest date d'au moins 300 secondes
    Et je nomme l'identifiant de l'opération IngestOperationId
    Quand on lance la traçabilité des journaux de cycles de vie des unités archivistiques
    Et on lance la traçabilité des journaux de cycles de vie des groupes d'objets
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
    Et je lance un audit de cohérence
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_PREPARE_REPORT est EVIDENCE_AUDIT_PREPARE_REPORT.OK


  Scénario: Cas KO ($threshold = 0)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/1_UNIT_1_GOT_WITH_RULES.zip
    Et que l'ingest date d'au moins 300 secondes
    Et je nomme l'identifiant de l'opération IngestOperationId
    Quand on lance la traçabilité des journaux de cycles de vie des unités archivistiques
    Et on lance la traçabilité des journaux de cycles de vie des groupes d'objets
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
    Et je lance un audit de cohérence
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_FINALIZE est EVIDENCE_AUDIT_FINALIZE.WARNING


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
    Et je lance un audit de cohérence
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_PREPARE_REPORT est EVIDENCE_AUDIT_PREPARE_REPORT.WARNING