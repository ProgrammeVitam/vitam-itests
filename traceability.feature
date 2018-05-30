# language: fr

@Traceability
Fonctionnalité: Génération journal des opérations sécurisé
	Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  #### Logbook operation traceability ####
  Scénario: Sécurisation du journal d’opération OK
    Quand je génère un journal des opérations sécurisé
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OP_SECURISATION, OP_SECURISATION_TIMESTAMP, OP_SECURISATION_STORAGE sont OK


  Scénario: Test d'audit sans securisation
    # Audit without traceability (forced new ingest)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/3_UNITS_2_GOTS.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        { "$in": { "#operations": [ "Operation-Id" ] } },
        { "$exists" : "Title" }
      ]
    }],
    "$projection": { }
}
"""
    Et je réalise un audit de traçabilité de la requete
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_FINALIZE est EVIDENCE_AUDIT_FINALIZE.WARNING


  Scénario: Test d'audit avec securisation
    # Audit with traceability (already ingested file in _prepareTraceability.feature, at least 5 minutes ago)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/3_UNITS_2_GOTS.zip
    Quand on lance la traçabilité des journaux de cycles de vie des unités archivistiques
    Et on lance la traçabilité des journaux de cycles de vie des groupes d'objets
    Et j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        { "$in": { "#operations": [ "Operation-Id" ] } },
        { "$exists" : "Title" }
      ]
    }],
    "$projection": { }
}
"""
    Et je réalise un audit de traçabilité de la requete
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_FINALIZE est EVIDENCE_AUDIT_FINALIZE.OK

