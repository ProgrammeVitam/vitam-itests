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

  #### AU Ingest ####
  Scénario: Test d'audit sans securisation
    # Audit without traceability
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {

          "$eq": {
            "Title": "BAD0431E2C5E80E5BD42D547A3ED596444446.odt"
          }

    }
  ],
  "$projection": {
  }
}
"""
    Et je réalise un audit de traçabilité de la requete
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_FINALIZE est EVIDENCE_AUDIT_FINALIZE.WARNING

  #### GOT Ingest ####
  Scénario: Test d'audit avec securisation
        # Audit avec traçabilité
    Quand on lance la traçabilité des journaux de cycles de vie
    Et j'utilise la requête suivante
  """
{
  "$roots": [],
  "$query": [
    {

          "$eq": {
            "Title": "BAD0431E2C5E80E5BD42D547A3ED596444446.odt"
          }

    }
  ],
  "$projection": {
  }
}
"""
    Et je réalise un audit de traçabilité de la requete
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et l'outcome détail de l'événement EVIDENCE_AUDIT_FINALIZE est EVIDENCE_AUDIT_FINALIZE.OK
