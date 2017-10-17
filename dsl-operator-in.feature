#language: fr

@DslOperatorIn
Fonctionnalité: Test operateur IN du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test opérateur $in du dsl sur DescriptionLevel
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DescriptionLevel": [
                         "Item"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DescriptionLevel": [
                         "RecordGrp"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 7
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DescriptionLevel": [
                         "RecordGrp", "Item"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 17
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DescriptionLevel": [
                         "Test"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DescriptionLevel": [
                         "Test", "Item", "RecordGrp"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 17

  Scénario: Test opérateur $in du dsl sur Title
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Title": [
                         "unit"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 6
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Title": [
                         "unit", "racine"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 6
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Title": [
                         "unit", "racine", "sit"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 8

  Scénario: Test opérateur $in du dsl sur Description
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Description": [
                         "mi"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Description": [
                         "est"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Description": [
                         "mi", "est"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Description": [
                         "mi", "est", "semper"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 9
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "Description": [
                         "mi", "est", "semper", "vitae", "tortor", "nostra", "eu", "mauris", "sem", "magna",
                         "nullam", "imperdiet"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 14

  Scénario: Test opérateur $in du dsl sur StartDate
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "StartDate": [
                         "2016-08-05T09:28:15", "2016-05-25T12:05:11"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 3


  Scénario: Test opérateur $in du dsl sur champs libres
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTest": [
                         "in1"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 12
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTest": [
                         "in1", "in2"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 12

  Scénario: Test opérateur $in du dsl sur champs libres entier
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestNum": [
                         1
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 3
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestNum": [
                         1, 7
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 4
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestNum": [
                         1, 7, 8
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestNum": [
                         1, 7, 8, 900
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 9

  Scénario: Test opérateur $in du dsl sur champs libres tableau
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    Quand je télécharge le SIP
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 2
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a", "b"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 3
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a", "b", "g"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a", "b", "g", "e"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 6
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a", "b", "g", "e", "f"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 6
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    {
                         "$in": {
                              "#operations": [
                                   "Operation-Id"
                              ]
                         }
                    }
               ],
               "$depth": 0
          },
          {
               "$in": {
                    "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3": [
                         "a", "b", "g", "e", "f", "o"
                    ]
               },
               "$depth": 0
          }
     ],
     "$projection": {
          "$fields": {
               "#id": 1
          }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 7
