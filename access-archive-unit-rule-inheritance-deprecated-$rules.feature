# language: fr

@Access
@ArchiveUnit
Fonctionnalité: Calcul des règles de gestion via $rules (déprécié)

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
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.StorageRule.R3.{{unit:AU13}}.path        | [["{{unit:AU13}}","{{unit:AU14}}"]]                                  |
	| inheritedRule.StorageRule.R4.{{unit:AU14}}.path        | [["{{unit:AU14}}"]]                                                 |


  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA3)  (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_PREVENT_INHERITANCE.zip
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
	| inheritedRule.StorageRule.R4.{{unit:AU34}}.path        | [["{{unit:AU34}}"]]                                                 |


  Scénario: Recherche une archive unit avec les règles héritées en cas de la prévention d'héritage (PreventInheritance item_1066_CA4)  (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_PREVENT_INHERITANCE.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU41}}.path        | [["{{unit:AU41}}","{{unit:AU42}}","{{unit:AU43}}","{{unit:AU44}}"]]    |
	| inheritedRule.StorageRule.R3.{{unit:AU43}}.path        | [["{{unit:AU43}}","{{unit:AU44}}"]]                                  |
	| inheritedRule.StorageRule.R4.{{unit:AU44}}.path        | [["{{unit:AU44}}"]]                                                 |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA1)  (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_REFNONRULEID.zip
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
	| inheritedRule.StorageRule.R2.{{unit:AU12}}.path        | [["{{unit:AU12}}","{{unit:AU13}}","{{unit:AU14}}"]]    |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA4) (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_REFNONRULEID.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU41}}.path        | [["{{unit:AU41}}","{{unit:AU42}}","{{unit:AU43}}","{{unit:AU44}}"]]    |
	| inheritedRule.StorageRule.R2.{{unit:AU42}}.path        | [["{{unit:AU42}}","{{unit:AU43}}","{{unit:AU44}}"]]                   |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA5) (déprécié)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_REFNONRULEID.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU51}}.path            | [["{{unit:AU51}}","{{unit:AU52}}","{{unit:AU53}}","{{unit:AU54}}"]]    |
	| inheritedRule.StorageRule.R1.{{unit:AU51}}.StartDate       | "2017-01-01"                                                       |
	| inheritedRule.StorageRule.R1.{{unit:AU51}}.FinalAction     | "RestrictAccess"                                                   |
	| inheritedRule.StorageRule.R1.{{unit:AU51}}.EndDate         | "2018-01-01"                                                       |
	| inheritedRule.StorageRule.R2.{{unit:AU52}}.path            | [["{{unit:AU52}}","{{unit:AU53}}","{{unit:AU54}}"]]                   |
	| inheritedRule.StorageRule.R2.{{unit:AU52}}.StartDate       | "2017-02-01"                                                       |
	| inheritedRule.StorageRule.R2.{{unit:AU52}}.FinalAction     | "RestrictAccess"                                                   |
	| inheritedRule.StorageRule.R2.{{unit:AU52}}.EndDate         | "2019-02-01"                                                       |
	| inheritedRule.AccessRule.ACC-00001.{{unit:AU51}}.path      | [["{{unit:AU51}}","{{unit:AU52}}","{{unit:AU53}}","{{unit:AU54}}"]]    |
	| inheritedRule.AccessRule.ACC-00001.{{unit:AU51}}.StartDate | "2017-01-01"                                                       |
	| inheritedRule.AccessRule.ACC-00001.{{unit:AU51}}.EndDate   | "2017-01-01"                                                       |


  Scénario: Recherche une archive unit avec les règles héritées en cas de l'exclusion d'héritage (RefNonRuleId item_2093_CA6)
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_REFNONRULEID.zip
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
	| inheritedRule.StorageRule.R1.{{unit:AU61}}.path        | [["{{unit:AU61}}","{{unit:AU62}}","{{unit:AU63}}","{{unit:AU64}}"]]    |
	| inheritedRule.StorageRule.R2.{{unit:AU62}}.path        | [["{{unit:AU62}}","{{unit:AU63}}","{{unit:AU64}}"]]                   |
	| inheritedRule.AccessRule.ACC-00001.{{unit:AU61}}.path  | [["{{unit:AU61}}","{{unit:AU62}}","{{unit:AU63}}","{{unit:AU64}}"]]    |


  Scénario: Prise en compte de plusieurs règles du bloc ManagementMetadata avec un seul FinalAction
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/BUG_3707/BUG_3707.zip
    Quand je télécharge le SIP
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU1"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | #management.StorageRule             | {"Rules":[{"Rule":"R1","StartDate":"2017-01-01","EndDate":"2018-01-01"},{"Rule":"R6","StartDate":"2021-01-01","EndDate":"2027-01-01"}],"FinalAction":"RestrictAccess"} |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.path            | [["{{unit:AU1}}"]]                                                 |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.EndDate         | "2027-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU1}}.path            | [["{{unit:AU1}}"]]                                                 |
      | inheritedRule.StorageRule.R1.{{unit:AU1}}.StartDate       | "2017-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU1}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R1.{{unit:AU1}}.EndDate         | "2018-01-01"                                                       |

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU2"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | #management.StorageRule             | {"Rules":[{"Rule":"R2","StartDate":"2018-01-01","EndDate":"2020-01-01"},{"Rule":"R6","StartDate":"2021-01-01","EndDate":"2027-01-01"},{"Rule":"R1","StartDate":"1900-01-01","EndDate":"1901-01-01"}],"FinalAction":"RestrictAccess"} |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.path            | [["{{unit:AU2}}"]]                                                 |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.EndDate         | "2027-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.path            | [["{{unit:AU2}}"]]                                                 |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.StartDate       | "2018-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.EndDate         | "2020-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU2}}.path            | [["{{unit:AU2}}"]]                                                 |
      | inheritedRule.StorageRule.R1.{{unit:AU2}}.StartDate       | "1900-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R1.{{unit:AU2}}.EndDate         | "1901-01-01"                                                       |
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU7"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | #management.StorageRule             | {"Rules":[{"Rule":"R6","StartDate":"2021-01-01","EndDate":"2027-01-01"},{"Rule":"R1","StartDate":"1900-01-01","EndDate":"1901-01-01"}],"FinalAction":"Copy"} |
      | inheritedRule.StorageRule.R6.{{unit:AU7}}.path            | [["{{unit:AU7}}"]]                                                 |
      | inheritedRule.StorageRule.R6.{{unit:AU7}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU7}}.FinalAction     | "Copy"                                                             |
      | inheritedRule.StorageRule.R6.{{unit:AU7}}.EndDate         | "2027-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU7}}.path            | [["{{unit:AU7}}"]]                                                 |
      | inheritedRule.StorageRule.R1.{{unit:AU7}}.StartDate       | "1900-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU7}}.FinalAction     | "Copy"                                                             |
      | inheritedRule.StorageRule.R1.{{unit:AU7}}.EndDate         | "1901-01-01"                                                       |
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU4"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.path            | [["{{unit:AU3}}","{{unit:AU4}}"]]                                  |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.StartDate       | "2110-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.EndDate         | "2111-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.path            | [["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]                   |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.StartDate       | "2018-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.EndDate         | "2020-01-01"                                                       |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.path            | [["{{unit:AU3}}","{{unit:AU4}}"]]                                  |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.StartDate       | "2020-01-01"                                                       |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.EndDate         | "2023-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.path            | [["{{unit:AU1}}","{{unit:AU3}}","{{unit:AU4}}"]]                   |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.EndDate         | "2027-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.path            | [["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}"]]                   |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.EndDate         | "2027-01-01"                                                       |
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"AU6"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.path            | ["{{unit:AU3}}","{{unit:AU4}}","{{unit:AU6}}"]                     |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.path            | ["{{unit:AU3}}","{{unit:AU5}}","{{unit:AU6}}"]                     |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.StartDate       | "2110-01-01"                                                       |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R1.{{unit:AU3}}.EndDate         | "2111-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.path            | ["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.path            | ["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU5}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.StartDate       | "2018-01-01"                                                       |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R2.{{unit:AU2}}.EndDate         | "2020-01-01"                                                       |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.path            | ["{{unit:AU3}}","{{unit:AU4}}","{{unit:AU6}}"]                     |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.path            | ["{{unit:AU3}}","{{unit:AU5}}","{{unit:AU6}}"]                     |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.StartDate       | "2020-01-01"                                                       |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R3.{{unit:AU3}}.EndDate         | "2023-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.path            | ["{{unit:AU1}}","{{unit:AU3}}","{{unit:AU4}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.path            | ["{{unit:AU1}}","{{unit:AU3}}","{{unit:AU5}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU1}}.EndDate         | "2027-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.path            | ["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU4}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.path            | ["{{unit:AU2}}","{{unit:AU3}}","{{unit:AU5}}","{{unit:AU6}}"]      |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.StartDate       | "2021-01-01"                                                       |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.FinalAction     | "RestrictAccess"                                                   |
      | inheritedRule.StorageRule.R6.{{unit:AU2}}.EndDate         | "2027-01-01"                                                       |
