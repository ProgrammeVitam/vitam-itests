# language: fr

@DslGraphRootDepth
Fonctionnalité: DSL test sur les graphes avec root et avec depth

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS
      
### TESTS on depth default

  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth default on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 3 (SEDA IDs ID0301), level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root_default_depth.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Alors le statut de select résultat est Bad Request
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root_default_depth.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Alors le statut de select résultat est Bad Request
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root_default_depth.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0301
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Alors le statut de select résultat est Bad Request
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root_default_depth.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Alors le statut de select résultat est Bad Request
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
      
### TESTS on depth 0

  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth 0 on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 3 (SEDA IDs ID0301), level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0301
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |
      
### TESTS on depth 1

  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth 1 on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 3 (SEDA IDs ID0301), level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0301
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
      
### TESTS on depth 2
   
  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth 2 on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 3 (SEDA IDs ID0301), level 4 (SEDA IDs ID0401), level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0301
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0401
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0401
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
      
### TESTS on depth 3
   
  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth 3 on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 3 (SEDA IDs ID0301), level 4 (SEDA IDs ID0401), level 5 (SEDA IDs ID0501), level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0301
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0401
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0401
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0501
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0501
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
      
### TESTS on depth -1 / FIXME
   
#  Scénario: Dsl select by title with root (SEDA IDs ID0101) depth -1 on level 1 / ROOT (SEDA IDs ID0101), level 2 (SEDA IDs ID0201), level 9 / LEAF (SEDA IDs ID0901)
#    Etant donné les tests effectués sur le tenant 0
#    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
#    Quand je télécharge le SIP
#    Alors le statut final du journal des opérations est OK
#    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
#    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0101
#    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
#    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
#    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
#    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0201
#    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
#    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0
#    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_root.json
#    Et j'utilise dans la requête le GUID de l'unité archivistique pour le titre Archive unit ID0901
#    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
#    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
#    Et je recherche les unités archivistiques
#    Alors le nombre de résultat est 0     
      
