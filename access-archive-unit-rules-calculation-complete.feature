# language: fr

@AccessArchiveUnit
Fonctionnalité: Calcul des règles de gestion sur jeu de test complexe complet

Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type ENTRY_CONTRACTS
    
  Scénario: Recherche une archive unit avec les règles héritées 1 (1_Saint Denis Université) : régle globale héritée sur la racine (ACC-00002)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"1_Saint Denis Université"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:1_Saint Denis Université}}.path.array[][]        | [["{{unit:1_Saint Denis Université}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:1_Saint Denis Université}}.StartDate   | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:1_Saint Denis Université}}.EndDate     | "2025-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 2 (2_Front Populaire) : régle globale héritée sur la racine (ACC-00002) mergée avec celle de la racine de même catégorie (ACC-00003)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"2_Front Populaire"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:2_Front Populaire}}.path.array[][]        | [["{{unit:2_Front Populaire}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:2_Front Populaire}}.StartDate   | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:2_Front Populaire}}.EndDate     | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.path.array[][]        | [["{{unit:2_Front Populaire}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.StartDate   | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.EndDate     | "2025-01-01" |	
	

  Scénario: Recherche une archive unit avec les règles héritées 3 (3_Gallieni) : régle globale héritée sur la racine (ACC-00002) mergée avec la date de début de la racine
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"3_Gallieni"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.path.array[][]           | [["{{unit:3_Gallieni}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.StartDate      | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.EndDate        | "2027-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 4 (4_ Porte de Clignancourt) : régle globale héritée sur la racine (ACC-00002) mergée avec celle de la racine de catégorie différente (DIS-00001)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"4_ Porte de Clignancourt"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.path.array[][]               | [["{{unit:4_ Porte de Clignancourt}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.EndDate            | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.path.array[][]        | [["{{unit:4_ Porte de Clignancourt}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.StartDate   | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.EndDate     | "2025-01-01" |
	

  Scénario: Recherche une archive unit avec les règles héritées 5 (5_Bobigny) : régle globale héritée sur la racine (ACC-00002) mergée avec la date de début de la racine qui contient un preventInheritence sur ACC
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"5_Bobigny"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.path.array[][]        | [["{{unit:5_Bobigny}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.StartDate   | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.EndDate     | "2027-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 6 (6_Pré Saint Gervais) : régle globale héritée sur la racine (ACC-00002) mergée avec des régles de même (ACC-00003) et différente catégorie (DIS-00001) avec refNonRuleId sur ACC-00002
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"6_Pré Saint Gervais"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.path.array[][]                | [["{{unit:6_Pré Saint Gervais}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.StartDate           | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.EndDate             | "2025-01-01" |
  | inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]         | [["{{unit:6_Pré Saint Gervais}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate    | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate      | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00002                                                  | {} |

  Scénario: Recherche une archive unit avec les règles héritées 7 (Saint Denis Basilique) : régle héritée bloquée (ACC-00002) sur unit qui contient un preventInheritence sur ACC
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Saint Denis Basilique"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule                                         | {} |
	| #management.AccessRule.Inheritance.PreventInheritance            | true |

  Scénario: Recherche une archive unit avec les règles héritées 8 (Porte de la Chapelle) : régles héritées(ACC-00002 et ACC-00003) sur unit qui surcharge un règle (ACC-00002)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Porte de la Chapelle"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.path.array[][]            | [["{{unit:Porte de la Chapelle}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.StartDate       | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.EndDate         | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.path.array[][]               | [["{{unit:2_Front Populaire}}","{{unit:Porte de la Chapelle}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:2_Front Populaire}}.EndDate            | "2025-01-01" |
	

  Scénario: Recherche une archive unit avec les règles héritées 9 (Gambetta) : régles héritées(ACC-00002) sur unit qui ajoute une règle de même catégorie (ACC-00003)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Gambetta"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.path.array[][]             | [["{{unit:3_Gallieni}}","{{unit:Gambetta}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.StartDate        | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:3_Gallieni}}.EndDate          | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Gambetta}}.path.array[][]               | [["{{unit:Gambetta}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Gambetta}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Gambetta}}.EndDate            | "2025-01-01" |
	
  Scénario: Recherche une archive unit avec les règles héritées 10 (Simplon) : régles héritées(ACC-00002 / DIS-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Simplon"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.path.array[][]               | [["{{unit:4_ Porte de Clignancourt}}","{{unit:Simplon}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:4_ Porte de Clignancourt}}.EndDate            | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.path.array[][]        | [["{{unit:4_ Porte de Clignancourt}}","{{unit:Simplon}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.StartDate   | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.EndDate     | "2025-01-01" |	

  Scénario: Recherche une archive unit avec les règles héritées 11 (Eglise de Pantin) : régles héritées(ACC-00002) sur unit qui ajoute plusieurs règle (STO-00001, APP-00002, ACC-00003, DIS-00001, REU-00001, CLASS-00001)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Eglise de Pantin"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.path.array[][]                         | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.StartDate                    | "2000-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.EndDate                      | "2001-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.FinalAction                  | "Copy" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.path.array[][]                       | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.StartDate                  | "2000-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.EndDate                    | "2005-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.FinalAction                | "Destroy" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.path.array[][]                                 | [["{{unit:5_Bobigny}}","{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.StartDate                            | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:5_Bobigny}}.EndDate                              | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.path.array[][]                          | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.StartDate                     | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.EndDate                       | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.path.array[][]                   | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.StartDate              | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.EndDate                | "2025-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.path.array[][]                           | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.StartDate                      | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.EndDate                        | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.path.array[][]                | [["{{unit:Eglise de Pantin}}"]] |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.StartDate           | "2000-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.EndDate             | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationLevel | "Secret D\u00E9fense" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationOwner | "RATP" |

  Scénario: Recherche une archive unit avec les règles héritées 12 (Place des Fêtes) : régles héritées(ACC-00003, DIS-00001) sur unit qui ajoute une règle (ACC-00001)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Place des Fêtes"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.path.array[][]                   | [["{{unit:Place des Fêtes}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.StartDate              | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.EndDate                | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.path.array[][]               | [["{{unit:6_Pré Saint Gervais}}","{{unit:Place des Fêtes}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.EndDate            | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]        | [["{{unit:6_Pré Saint Gervais}}","{{unit:Place des Fêtes}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate   | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate     | "2025-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 13 (Danube) : régles héritées(ACC-00003, DIS-00001) sur unit qui ajoute une règle (ACC-00036)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Danube"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.path.array[][]              | [["{{unit:6_Pré Saint Gervais}}","{{unit:Danube}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.StartDate         | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:6_Pré Saint Gervais}}.EndDate           | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.path.array[][]                           | [["{{unit:Danube}}"]] |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.StartDate                      | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.EndDate                        | "2100-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]       | [["{{unit:6_Pré Saint Gervais}}","{{unit:Danube}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate  | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate    | "2025-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 14 (Carrefour Pleyel) : pas de régles héritées sur unit qui ajoute plusieurs règles (STO-00001, DIS-00001, REU-00001)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Carrefour Pleyel"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.StorageRule.STO-00001.{{unit:Carrefour Pleyel}}.path.array[][]             | [["{{unit:Carrefour Pleyel}}"]] |
	| inheritedRule.StorageRule.STO-00001.{{unit:Carrefour Pleyel}}.StartDate        | "2000-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Carrefour Pleyel}}.EndDate          | "2001-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Carrefour Pleyel}}.FinalAction      | "Copy" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Carrefour Pleyel}}.path.array[][]       | [["{{unit:Carrefour Pleyel}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Carrefour Pleyel}}.StartDate  | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Carrefour Pleyel}}.EndDate    | "2025-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.path.array[][]               | [["{{unit:Carrefour Pleyel}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.StartDate          | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.EndDate            | "2010-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 15 (Marx Dormoy) : régle héritée (ACC-00002) et règle bloquée (RefNonRuleId ACC-00003) sur unit qui ajoute une règle (DIS-00002)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Marx Dormoy"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.path.array[][]             | [["{{unit:Porte de la Chapelle}}","{{unit:Marx Dormoy}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.StartDate        | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.EndDate          | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00003                                                | {} |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Marx Dormoy}}.path.array[][]     | [["{{unit:Marx Dormoy}}"]] |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Marx Dormoy}}.StartDate          | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Marx Dormoy}}.EndDate            | "2075-01-01" |
	| #management.AccessRule.Inheritance.PreventRulesId.array[]                         | "ACC-00003" |

  Scénario: Recherche une archive unit avec les règles héritées 16 (Père Lachaise) : régle héritées (ACC-00002, ACC-00003) bloquées (PreventInheritance ACC) sur unit qui ajoute des règles (ACC-00004, ACC-00005)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Père Lachaise"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002                                           | {} |
	| inheritedRule.AccessRule.ACC-00003                                           | {} |
	| inheritedRule.AccessRule.ACC-00004.{{unit:Père Lachaise}}.path.array[][]     | [["{{unit:Père Lachaise}}"]] |
	| inheritedRule.AccessRule.ACC-00004.{{unit:Père Lachaise}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00004.{{unit:Père Lachaise}}.EndDate            | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.path.array[][]     | [["{{unit:Père Lachaise}}"]] |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.EndDate            | "2025-01-01" |
	| #management.AccessRule.Inheritance.PreventInheritance                        | true |

  Scénario: Recherche une archive unit avec les règles héritées 17 (Château Rouge) : régle héritées (ACC-00002, DIS-00001) sur unit qui ajoute une règle (ACC-00003)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Château Rouge"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002                                                     | {} |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.path.array[][]                         | [["{{unit:Château Rouge}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.StartDate                    | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.EndDate                      | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.path.array[][]       | [["{{unit:4_ Porte de Clignancourt}}","{{unit:Simplon}}","{{unit:Château Rouge}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.StartDate  | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:4_ Porte de Clignancourt}}.EndDate    | "2025-01-01" |
	| #management.AccessRule.Inheritance.PreventInheritance                                  | true |	

  Scénario: Recherche une archive unit avec les règles héritées 18 (Porte de Pantin) : régle héritées (STO-00001, APP-00003, ACC-00002, ACC-00003, DIS-00001, REU-00001, CLASS-00003) sur unit qui ajoute des règles (ACC-00002, DIS-00002) et bloque l'héritage ACC-00002 (RefNonRuleId)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Porte de Pantin"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.path.array[][]                          | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.StartDate                     | "2000-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.EndDate                       | "2001-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.FinalAction                   | "Copy" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.path.array[][]                        | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.StartDate                   | "2000-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.EndDate                     | "2005-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.FinalAction                 | "Destroy" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.path.array[][]                            | [["{{unit:Porte de Pantin}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.StartDate                       | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.EndDate                         | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.path.array[][]                           | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.StartDate                      | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.EndDate                        | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.path.array[][]                    | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.StartDate               | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.EndDate                 | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.path.array[][]                     | [["{{unit:Porte de Pantin}}"]] |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.StartDate                | {} |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.EndDate                  | {} |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.path.array[][]                            | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.StartDate                       | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.EndDate                         | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.path.array[][]                 | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}"]] |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.StartDate            | "2000-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.EndDate              | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationLevel  | "Secret D\u00E9fense" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationOwner  | "RATP" |
	| #management.AccessRule.Inheritance.PreventRulesId.array[]                                   | "ACC-00002" |

  Scénario: Recherche une archive unit avec les règles héritées 19 (Botzaris) : régles héritées par deux chemins (ACC-00001, ACC-00003, ACC-00036, DIS-00001) sur unit qui surcharge une règle (ACC-00003)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Botzaris"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.path.array[][]                    | [["{{unit:Place des Fêtes}}","{{unit:Botzaris}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.StartDate               | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.EndDate                 | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002                                                  | {} |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.path.array[][]                           | [["{{unit:Botzaris}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.StartDate                      | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.EndDate                        | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.path.array[][]                             | [["{{unit:Danube}}","{{unit:Botzaris}}"]] |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.StartDate                        | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.EndDate                          | "2100-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]         | [["{{unit:6_Pré Saint Gervais}}","{{unit:Danube}}","{{unit:Botzaris}}"],["{{unit:6_Pré Saint Gervais}}","{{unit:Place des Fêtes}}","{{unit:Botzaris}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate    | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate      | "2025-01-01" |

  Scénario: Recherche une archive unit avec les règles héritées 20 (Saint-Lazare) : régles héritées par deux chemins (ACC-00002, DIS-00001, DIS-00002, STO-00001, REU-00001) sur unit qui bloque STO-00001 (RefNonRuleId) et DIS (PreventInheritence)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
	  Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Saint-Lazare"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.path.array[][]          | [["{{unit:Porte de la Chapelle}}","{{unit:Marx Dormoy}}","{{unit:Saint-Lazare}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.StartDate     | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.EndDate       | "2027-01-01" |
	| inheritedRule.DisseminationRule                                                | {} |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.path.array[][]               | [["{{unit:Carrefour Pleyel}}","{{unit:Saint-Lazare}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.StartDate          | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.EndDate            | "2010-01-01" |
	| inheritedRule.StorageRule                                                      | {} |
	| #management.StorageRule.Inheritance.PreventRulesId.array[]                     | "STO-00001" |
	| #management.DisseminationRule.Inheritance.PreventInheritance                   | true |

  Scénario: Recherche une archive unit avec les règles héritées 21 (République) : régles héritées (ACC-00004, ACC-00005) sur unit qui bloque ACC-00004 (RefNonRuleId) et ajoute ACC-00004
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
	  Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"République"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00004.{{unit:République}}.path.array[][]               | [["{{unit:République}}"]] |
	| inheritedRule.AccessRule.ACC-00004.{{unit:République}}.StartDate          | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00004.{{unit:République}}.EndDate            | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.path.array[][]            | [["{{unit:Père Lachaise}}","{{unit:République}}"]] |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.StartDate       | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00005.{{unit:Père Lachaise}}.EndDate         | "2025-01-01" |
  | #management.AccessRule.Inheritance.PreventRulesId.array[]                 | "ACC-00004" |


  Scénario: Recherche une archive unit avec les règles héritées 22 (Gare du Nord) : régles héritées (ACC-00002, ACC-00003, DIS-00001) sur unit qui bloque DIS-00001 (RefNonRuleId) et ajoute DIS-00002
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Gare du Nord"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.path.array[][]               | [["{{unit:Château Rouge}}","{{unit:Gare du Nord}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Château Rouge}}.EndDate            | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001                                    | {} |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Gare du Nord}}.path.array[][]         | [["{{unit:Gare du Nord}}"]] |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Gare du Nord}}.StartDate    | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Gare du Nord}}.EndDate      | "2075-01-01" |
  | #management.DisseminationRule.Inheritance.PreventRulesId.array[]             | "DIS-00001" |

  Scénario: Recherche une archive unit avec les règles héritées 23 (Stalingrad.txt) : régles héritées (STO-00001, APP-00002, ACC-00002, ACC-00003, DIS-00001, DIS-00002, REU-00001, CLASS-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Stalingrad.txt"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.path.array[][]                         | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.StartDate                    | "2000-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.EndDate                      | "2001-01-01" |
	| inheritedRule.StorageRule.STO-00001.{{unit:Eglise de Pantin}}.FinalAction                  | "Copy" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.path.array[][]                       | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.StartDate                  | "2000-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.EndDate                    | "2005-01-01" |
	| inheritedRule.AppraisalRule.APP-00002.{{unit:Eglise de Pantin}}.FinalAction                | "Destroy" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.path.array[][]                           | [["{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.StartDate                      | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de Pantin}}.EndDate                        | "2025-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.path.array[][]                          | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.StartDate                     | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Eglise de Pantin}}.EndDate                       | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.path.array[][]                   | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.StartDate              | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Eglise de Pantin}}.EndDate                | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.path.array[][]                    | [["{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.StartDate               | {} |
	| inheritedRule.DisseminationRule.DIS-00002.{{unit:Porte de Pantin}}.EndDate                 | {} |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.path.array[][]                           | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.StartDate                      | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Eglise de Pantin}}.EndDate                        | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.path.array[][]                | [["{{unit:Eglise de Pantin}}","{{unit:Porte de Pantin}}","{{unit:Stalingrad.txt}}"]] |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.StartDate           | "2000-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.EndDate             | "2010-01-01" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationLevel | "Secret D\u00E9fense" |
	| inheritedRule.ClassificationRule.CLASS-00001.{{unit:Eglise de Pantin}}.ClassificationOwner | "RATP" |


  Scénario: Recherche une archive unit avec les règles héritées 24 (Buttes-Chaumont) : régles héritées par deux chemins (ACC-00001, ACC-00003, ACC-00036, DIS-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Buttes-Chaumont"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.path.array[][]                      | [["{{unit:Place des Fêtes}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.StartDate                 | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.EndDate                   | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.path.array[][]                             | [["{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.StartDate                        | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.EndDate                          | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.path.array[][]                               | [["{{unit:Danube}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}"]] |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.StartDate                          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.EndDate                            | "2100-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]           | [["{{unit:6_Pré Saint Gervais}}","{{unit:Danube}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}"],["{{unit:6_Pré Saint Gervais}}","{{unit:Place des Fêtes}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate      | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate        | "2025-01-01" |


  Scénario: Recherche une archive unit avec les règles héritées 25 (Montparnasse.txt) : régles héritées par deux chemins (ACC-00002, REU-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Montparnasse.txt"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.path.array[][]          | [["{{unit:Porte de la Chapelle}}","{{unit:Marx Dormoy}}","{{unit:Saint-Lazare}}","{{unit:Montparnasse.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.StartDate     | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00002.{{unit:Porte de la Chapelle}}.EndDate       | "2027-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.path.array[][]               | [["{{unit:Carrefour Pleyel}}","{{unit:Saint-Lazare}}","{{unit:Montparnasse.txt}}"]] |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.StartDate          | "2000-01-01" |
	| inheritedRule.ReuseRule.REU-00001.{{unit:Carrefour Pleyel}}.EndDate            | "2010-01-01" |
	

  Scénario: Recherche une archive unit avec les règles héritées 26 (Réaumur) : régles héritées par deux chemins (ACC-00002, ACC-00003, ACC-00004, ACC-00005, DIS-00002) sur unit qui bloques les ACC (PreventInheritence), DIS-00002 (RefNonRuleId) et qui ajoute ACC-00001 et DIS-00001
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Réaumur"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1,
    "#management": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
  | inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.path.array[][]               | [["{{unit:Réaumur}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.EndDate            | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00004                                     | {} |
	| inheritedRule.AccessRule.ACC-00005                                     | {} |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.path.array[][]        | [["{{unit:Réaumur}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.StartDate   | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.EndDate     | "2025-01-01" |
	| inheritedRule.DisseminationRule.DIS-00002                              | {} |
  | #management.AccessRule.Inheritance.PreventInheritance                  | true |
	| #management.DisseminationRule.Inheritance.PreventRulesId.array[]       | "DIS-00002" |
	

  Scénario: Recherche une archive unit avec les règles héritées 27 (Bolivar.txt) : régles héritées par deux chemins (ACC-00001, ACC-00003, ACC-00036, DIS-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Bolivar.txt"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.path.array[][]                 | [["{{unit:Place des Fêtes}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}","{{Bolivar.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.StartDate            | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Place des Fêtes}}.EndDate              | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.path.array[][]                        | [["{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}","{{Bolivar.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.StartDate                   | "2002-01-01" |
	| inheritedRule.AccessRule.ACC-00003.{{unit:Botzaris}}.EndDate                     | "2027-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.path.array[][]                          | [["{{unit:Danube}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}","{{Bolivar.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.StartDate                     | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00036.{{unit:Danube}}.EndDate                       | "2100-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.path.array[][]      | [["{{unit:6_Pré Saint Gervais}}","{{unit:Danube}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}","{{Bolivar.txt}}"],["{{unit:6_Pré Saint Gervais}}","{{unit:Place des Fêtes}}","{{unit:Botzaris}}","{{unit:Buttes-Chaumont}}","{{Bolivar.txt}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.StartDate | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:6_Pré Saint Gervais}}.EndDate   | "2025-01-01" |


  Scénario: Recherche une archive unit avec les règles héritées 28 (ereire.txt) : régles héritées par deux chemins (ACC-00001, DIS-00001) sur unit
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Et je télécharge le SIP
    Et le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Pereire.txt"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
  "$projection": {
  "$fields": {
    "$rules": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
  | inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.path.array[][]               | [["{{unit:Réaumur}}","{{Pereire.txt}}"]] |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.StartDate          | "2000-01-01" |
	| inheritedRule.AccessRule.ACC-00001.{{unit:Réaumur}}.EndDate            | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.path.array[][]        | [["{{unit:Réaumur}}","{{Pereire.txt}}"]] |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.StartDate   | "2000-01-01" |
	| inheritedRule.DisseminationRule.DIS-00001.{{unit:Réaumur}}.EndDate     | "2025-01-01" |
	

