# language: fr

@Access
@ArchiveUnit
Fonctionnalité: Calcul des règles de gestion via $rules ($rules n'est plus supporté)

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA1)  (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_PREVENT_INHERITANCE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU14"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Alors le statut de select résultat est Bad Request
    Et le message de select résultat est Projection field $rules is no longer supported.