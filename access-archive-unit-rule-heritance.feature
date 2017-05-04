# language: fr

@AccessArchiveUnit
Fonctionnalité: Calcul des règles de gestion

Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA1)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1066/1066_CA1.zip
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
	| inheritedRule.StorageRule.R3.{{unit:AU3}}.path        | [["{{unit:AU3}}","{{unit:AU4}}"]]                                  |
	| inheritedRule.StorageRule.R4.{{unit:AU4}}.path        | [["{{unit:AU4}}"]]                                                 |


  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA3)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1066/1066_CA3.zip
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


  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA4)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1066/1066_CA4.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU1}}.path        | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |
	| inheritedRule.StorageRule.R3.{{unit:AU3}}.path        | [["{{unit:AU3}}","{{unit:AU4}}"]]                                  |
	| inheritedRule.StorageRule.R4.{{unit:AU4}}.path        | [["{{unit:AU4}}"]]                                                 |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA1)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2093/2093_CA_1.zip
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
	| inheritedRule.StorageRule.R2.{{unit:AU2}}.path        | [["{{unit:AU2}}","{{unit:AU4}}"]]    |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA4)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2093/2093_CA_4.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU1}}.path        | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |
	| inheritedRule.StorageRule.R2.{{unit:AU2}}.path        | [["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]                   |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA5)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2093/2093_CA_5.zip
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
  | inheritedRule                                         | {"StorageRule":{"R1":{"{{unit:AU1}}":{"StartDate":"2017-01-01","RefNonRuleId":["R5"],"FinalAction":"RestrictAccess","EndDate":"2018-01-01","path":[["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]}},"R2":{"{{unit:AU2}}":{"StartDate":"2017-02-01","FinalAction":"RestrictAccess","EndDate":"2019-02-01","path":[["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]}}},"AccessRule":{"ACC-00001":{"{{unit:AU1}}":{"StartDate":"2017-01-01","EndDate":"2017-01-01","path":[["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]}}}}}],"$context":{"$roots":["{{unit:AU4}}"],"$query":[],"$filter":{},"$projection":{"$fields":{"$rules":1}}}}|
	| inheritedRule.StorageRule.R1.{{unit:AU1}}.path        | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]    |
	| inheritedRule.StorageRule.R2.{{unit:AU2}}.path        | [["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]                   |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA6)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2093/2093_CA_6.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU1}}.path        | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU4}}"]]    |
	| inheritedRule.StorageRule.R2.{{unit:AU2}}.path        | [["{{unit:AU2}}","{{unit:AU4}}"]]                   |
