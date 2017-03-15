# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Recherche une archive unit avec les règles héritées
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA6.zip
    Quand je télécharge le SIP
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU4"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 20}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | inheritedRule.StorageRule.R1.{{unit:AU1}}.path | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU4}}"],["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]] |



