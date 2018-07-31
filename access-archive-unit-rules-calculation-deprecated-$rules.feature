# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Recherche une archive unit avec les règles héritées(CA1)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU14"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	|inheritedRule.StorageRule.R1.{{unit:AU11}}.path | [["{{unit:AU11}}","{{unit:AU12}}","{{unit:AU13}}","{{unit:AU14}}"]] |
	|inheritedRule.StorageRule.R3.{{unit:AU13}}.path | [["{{unit:AU13}}","{{unit:AU14}}"]] |
	|inheritedRule.StorageRule.R4.{{unit:AU14}}.path | [["{{unit:AU14}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA2)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU24"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	|inheritedRule.StorageRule.R1.{{unit:AU24}}.path | [["{{unit:AU24}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA3)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU34"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	|inheritedRule.StorageRule.R1.{{unit:AU34}}.path | [["{{unit:AU34}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA4)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU44"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	|inheritedRule.StorageRule.R1.{{unit:AU41}}.path | [["{{unit:AU41}}","{{unit:AU42}}","{{unit:AU43}}","{{unit:AU44}}"]] |
	|inheritedRule.StorageRule.R5.{{unit:AU45}}.path | [["{{unit:AU45}}","{{unit:AU43}}","{{unit:AU44}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA5)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU54"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	|inheritedRule.StorageRule.R1.{{unit:AU51}}.path | [["{{unit:AU51}}","{{unit:AU52}}","{{unit:AU53}}","{{unit:AU54}}"]] |
	|inheritedRule.StorageRule.R1.{{unit:AU55}}.path | [["{{unit:AU55}}","{{unit:AU53}}","{{unit:AU54}}"]] |


  Scénario: Recherche une archive unit avec les règles héritées(CA6)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_ENDDATE_COMPUTE.zip
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU64"}},{"$in":{"#operations":["Operation-Id"]}}]}],
    "$projection": {
    "$fields": {
      "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | inheritedRule.StorageRule.R1.{{unit:AU61}}.path | ["{{unit:AU61}}","{{unit:AU62}}","{{unit:AU63}}","{{unit:AU64}}"] |
      | inheritedRule.StorageRule.R1.{{unit:AU61}}.path | ["{{unit:AU61}}","{{unit:AU62}}","{{unit:AU64}}"] |
