# language: fr

@DslOperatorMatch
Fonctionnalité: DSL test opérateur match

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type ENTRY_CONTRACTS

  Scénario: Dsl operator $match $match_all $match_phrase $match_phrase_prefix sur des valeurs de type string not analyzed dans elasticsearch
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
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
                      },
                      {
                           "$match": {
                              "OriginatingAgency.Identifier": "Identifiant numéro deux"
                           }
                      }
                 ],
                 "$depth": 20
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
  # Dsl operator $match_all sur des valeurs de type string not analyzed dans elasticsearch
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
                      },
                      {
                           "$match_all": {
                              "OriginatingAgency.Identifier": "Identifiant numéro deux"
                           }
                      }
                 ],
                 "$depth": 20
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
  # Dsl operator $match_phrase sur des valeurs de type string not analyzed dans elasticsearch
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
                    },
                    {
                         "$match_phrase": {
                            "OriginatingAgency.Identifier": "Identifiant numéro deux"
                         }
                    }
               ],
               "$depth": 20
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
# Dsl operator $match_all sur des valeurs de type string not analyzed dans elasticsearch
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
                    },
                    {
                         "$match_phrase_prefix": {
                            "OriginatingAgency.Identifier": "Identifiant numéro deux"
                         }
                    }
               ],
               "$depth": 20
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

#######################################

Scénario: Dsl operator $match sur des champs de type string analyzed dans elasticsearch
  Etant donné les tests effectués sur le tenant 0
  Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
  Quand je télécharge le SIP
  # Opérateur $match sur un seul terme
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
                    },
                    {
                        "$match": {
                             "Description": "bravo"
                        }
                    }
               ],
               "$depth": 20
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
# Opérateur $match sur deux termes étant accolé dans 3AU et "Alpha" étant présent dans une autre AU
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
        },
        {
          "$match": {
            "Description": "bravo Alpha plus d'autres données"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match avec des valeurs à rechercher qui n'existent pas
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
        },
        {
          "$match": {
            "Description": "motinconnu autremotinconnu"
          }
        }
      ],
      "$depth": 20
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

#######################################

Scénario: Dsl operator $match_all sur des champs de type string analyzed dans elasticsearch
  Etant donné les tests effectués sur le tenant 0
  Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
  Quand je télécharge le SIP
  # Opérateur $match sur un seul terme
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
                    },
                    {
                        "$match_all": {
                             "Description": "bravo"
                        }
                    }
               ],
               "$depth": 20
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
# Opérateur $match_all sur deux termes dans le désordre, accolés dans 3AU et "Alpha" étant présent dans une autre AU
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
        },
        {
          "$match_all": {
            "Description": "bravo Alpha plus d'autres données"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match_all sur trois termes dans le désordre, dont les 3 ne sont présent que dans une seule AU
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
        },
        {
          "$match_all": {
            "Description": "bravo Elementum Alpha"
          }
        }
      ],
      "$depth": 20
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
Alors le nombre de résultat est 1
# Opérateur $match avec des valeurs à rechercher qui n'existent pas
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
        },
        {
          "$match_all": {
            "Description": "motinconnu autremotinconnu"
          }
        }
      ],
      "$depth": 20
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

#######################################

Scénario: Dsl operator $match_phrase sur des champs de type string analyzed dans elasticsearch
Etant donné les tests effectués sur le tenant 0
Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
Quand je télécharge le SIP
# Opérateur $match_phrase avec des valeurs dans le bon ordre en milieu de phrase
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
        },
        {
          "$match_phrase": {
            "Description": "charlie delta"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match_phrase avec des valeurs à rechercher qui existent dans le désordre
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
        },
        {
          "$match_phrase": {
            "Description": "bravo Alpha"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match_phrase avec des valeurs à rechercher qui existent dans l'ordre mais avec des termes entre les deux
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
        },
        {
          "$match_phrase": {
            "Description": "bravo delta"
          }
        }
      ],
      "$depth": 20
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

#######################################

Scénario: Dsl operator $match_phrase_prefix sur des champs de type string analyzed dans elasticsearch
Etant donné les tests effectués sur le tenant 0
Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
Quand je télécharge le SIP
# Opérateur $match_phrase_prefix avec des valeurs dans le bon ordre en début de phrase mais une de ces valeurs présente dans une autre AU
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
        },
        {
          "$match_phrase_prefix": {
            "Description": "Alpha bravo"
          }
        }
      ],
      "$depth": 20
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
Alors le nombre de résultat est 1
# Opérateur $match_phrase_prefix avec des valeurs dans le bon ordre en début de phrase
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
        },
        {
          "$match_phrase_prefix": {
            "Description": "Alpha bravo, charlie"
          }
        }
      ],
      "$depth": 20
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
Alors le nombre de résultat est 1
# Opérateur $match_phrase_prefix avec des valeurs dans le bon ordre en milieu de phrase
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
        },
        {
          "$match_phrase_prefix": {
            "Description": "charlie delta"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match_phrase_prefix avec des valeurs à rechercher qui existent dans le désordre
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
        },
        {
          "$match_phrase_prefix": {
            "Description": "bravo Alpha"
          }
        }
      ],
      "$depth": 20
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
# Opérateur $match_phrase avec des valeurs à rechercher qui existent dans l'ordre mais avec des termes entre les deux
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
        },
        {
          "$match_phrase_prefix": {
            "Description": "bravo delta"
          }
        }
      ],
      "$depth": 20
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


#################

Scénario: Dsl operator $match* sur des champs de type string analyzed dans elasticsearch pour des champs multi-valués
Etant donné les tests effectués sur le tenant 0
Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
Quand je télécharge le SIP
# Opérateur $match_phrase_prefix avec des valeurs dans le bon ordre en début de phrase mais une de ces valeurs présente dans une autre AU
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
        },
        {
  				"OPERATOR": {
  					"Descriptions.en": "tango"
  				}
  			},
  			{
  				"OPERATOR": {
  					"Addressee.Nationality": "Argentine"
  				}
  			}
        }
      ],
      "$depth": 20
    }
  ],
  "$projection": {
    "$fields": {
      "#id": 1
    }
  }
}
"""
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_all
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_phrase
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_phrase_prefix
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1

# Opérateur $match* avec des valeurs dans des tableaux de méta données libre
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
        },
        {
  				"OPERATOR": {
  					"DataString2": "Mon texte data2 3"
  				}
  			},
  			{
  				"OPERATOR": {
  					"DataString3.DataString33.DataString332": "Mon texte data332 2"
  				}
  			}
        }
      ],
      "$depth": 20
    }
  ],
  "$projection": {
    "$fields": {
      "#id": 1
    }
  }
}
"""
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_all
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_phrase
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
Et j'utilise dans la requête le paramètre OPERATOR avec la valeur $match_phrase_prefix
Et je recherche les unités archivistiques
Alors le nombre de résultat est 1
