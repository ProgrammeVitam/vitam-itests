# language: fr

@Audit
Fonctionnalité: Audit 
  Contexte: Avant de lancer cette suite de test, je présuppose que un contrat d'accès est chargé.
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS


  Scénario: Initial : Ingest du sip d'audit
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_audit.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: contrôler l'existence d'objet par Service producteur
    Etant donné les tests effectués sur le tenant 0
    Quand je veux faire un audit sur l'existence des objets par service producteur "ABCDEFG"
    Alors le réultat de l'audit est succès

  Scénario: contrôler l'intégrité d'objet par Service producteur
    Etant donné les tests effectués sur le tenant 0
    Quand je veux faire un audit sur l'intégrité des objets par service producteur "ABCDEFG"
    Alors le réultat de l'audit est succès

  Scénario: contrôler l'intégrité d'objet par Requête DSL
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_audit.zip
    Quand j'utilise le fichier de requête suivant data/queries/audit_dsl_on_operation.json
    Et je veux faire un audit sur l'intégrité des objets liés aux unités archivistiques de la requête
    Alors le réultat de l'audit est succès

