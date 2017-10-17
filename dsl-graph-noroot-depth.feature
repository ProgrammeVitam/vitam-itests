# language: fr

@DslGraphNoRootDepth
Fonctionnalité: DSL test sur les graphes sans root et avec depth

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

### TESTS on depth default

  Scénario: Dsl select by title without root depth default on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot_default_depth.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth default on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot_default_depth.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth default on level 3 (SEDA IDs ID0301)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot_default_depth.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |

  Scénario: Dsl select by title without root depth default on level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot_default_depth.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0401
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

### TESTS on depth 0

  Scénario: Dsl select by title without root depth 0 on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth 0 on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth 0 on level 3 (SEDA IDs ID0301)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |

  Scénario: Dsl select by title without root depth 0 on level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 0
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

### TESTS on depth 1

  Scénario: Dsl select by title without root depth 1 on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth 1 on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth 1 on level 3 (SEDA IDs ID0301)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |

  Scénario: Dsl select by title without root depth 1 on level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

### TESTS on depth 2
   
  Scénario: Dsl select by title without root depth 2 on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth 2 on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth 2 on level 3 (SEDA IDs ID0301)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |

  Scénario: Dsl select by title without root depth 2 on level 4 (SEDA IDs ID0401)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0401
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0401 |

  Scénario: Dsl select by title without root depth 2 on level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 2
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

### TESTS on depth 3
      
  Scénario: Dsl select by title without root depth 3 on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth 3 on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth 3 on level 3 (SEDA IDs ID0301)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0301
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0301 |

  Scénario: Dsl select by title without root depth 3 on level 4 (SEDA IDs ID0401)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0401
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0401 |

  Scénario: Dsl select by title without root depth 3 on level 5 (SEDA IDs ID0501)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0501
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0501 |

  Scénario: Dsl select by title without root depth 3 on level 9 / LEAF (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

### TESTS on depth -1
      
  Scénario: Dsl select by title without root depth -1 on level 1 / ROOT (SEDA IDs ID0101)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0101
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0101 |

  Scénario: Dsl select by title without root depth -1 on level 2 (SEDA IDs ID0201)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0201
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0201 |

  Scénario: Dsl select by title without root depth -1 on level 9 (SEDA IDs ID0901)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_GRAPH.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/dsl-graph/select_by_title_dsl_noroot.json
    Et j'utilise dans la requête le paramètre SEDA-ID-UNIT avec la valeur ID0901
    Et j'utilise dans la requête le paramètre DEPTH avec la valeur -1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Title            | Archive unit ID0901 |

