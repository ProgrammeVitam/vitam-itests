# language: fr

@AccessArchiveUnit
Fonctionnalité: Calcul des règles de gestion

Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/1066_CA6_corrige.zip
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
      | inheritedRule.StorageRule.R4.{{unit:AU4}}.path        | [["{{unit:AU4}}"]]                                                 |
      | inheritedRule.AccessRule.ACC-00001.{{unit:AU1}}.path  | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |
      | inheritedRule.AccessRule.ACC-00010.{{unit:AU6}}.path  | [["{{unit:AU6}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/2093_CA_8.zip
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
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.path        | [["{{unit:AU2}}","{{unit:AU4}}"]]                                  |
      | inheritedRule.AccessRule.ACC-00001.{{unit:AU1}}.path  | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |

