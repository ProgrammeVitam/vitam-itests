# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Recherche une archive unit avec les règles héritées(CA1)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA1.zip
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
	|inheritedRule.StorageRule.R1.{{unit:AU1}}.path | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]] |
	|inheritedRule.StorageRule.R3.{{unit:AU3}}.path | [["{{unit:AU3}}","{{unit:AU4}}"]] |
	|inheritedRule.StorageRule.R4.{{unit:AU4}}.path | [["{{unit:AU4}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA2)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA2.zip
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
	|inheritedRule.StorageRule.R1.{{unit:AU4}}.path | [["{{unit:AU4}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA3)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA3.zip
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
	|inheritedRule.StorageRule.R1.{{unit:AU4}}.path | [["{{unit:AU4}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA4)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA4_corrige.zip
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
	|inheritedRule.StorageRule.R1.{{unit:AU1}}.path | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]] |
	|inheritedRule.StorageRule.R5.{{unit:AU5}}.path | [["{{unit:AU5}}","{{unit:AU3}}","{{unit:AU4}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA5)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_1069/1069_CA5_corrige.zip
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
	|inheritedRule.StorageRule.R1.{{unit:AU1}}.path | [["{{unit:AU1}}","{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]] |
	|inheritedRule.StorageRule.R1.{{unit:AU5}}.path | [["{{unit:AU5}}","{{unit:AU3}}","{{unit:AU4}}"]] |

  
  Scénario: Recherche une archive unit avec les règles héritées(CA6)
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



