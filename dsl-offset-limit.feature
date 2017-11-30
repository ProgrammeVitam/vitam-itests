#language: fr

@DslOffsetLimit
Fonctionnalité: Test offset limit

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test $offset $limit
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_in.zip
    
# Recherche offset / limit *
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$in": {
        "#operations": [
          "Operation-Id"
        ]
      }
    }
  ],
  "$filter": {
    "$orderby": {
      "Title": 1
    },
    "$offset": 0,
    "$limit": 4
  },
  "$projection": {
    "$fields": {
      "Title": 1
    }
  }
}

"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 4
    Alors les metadonnées pour le résultat 0
    | Title                      | dossier_1    |
    Alors les metadonnées pour le résultat 1
    | Title                      | dossier_3    |
    Alors les metadonnées pour le résultat 2
    | Title                      | dossier_5    |
    Alors les metadonnées pour le résultat 3
    | Title                      | dossier_6    |
    

# Recherche offset / limit *
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$in": {
        "#operations": [
          "Operation-Id"
        ]
      }
    }
  ],
  "$filter": {
    "$orderby": {
      "Title": 1
    },
    "$offset": 2,
    "$limit": 2
  },
  "$projection": {
    "$fields": {
      "Title": 1
    }
  }
}

"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 2
    Alors les metadonnées pour le résultat 0
    | Title                      | dossier_5    |
    Alors les metadonnées pour le résultat 1
    | Title                      | dossier_6    |
    
# Recherche offset / limit Units *
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$in": {
        "#operations": [
          "Operation-Id"
        ]
      }
    }
  ],
  "$filter": {
    "$orderby": {
      "Title": 1
    },
    "$offset": 200,
    "$limit": 2
  },
  "$projection": {
    "$fields": {
      "Title": 1
    }
  }
}

"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

# Recherche offset / limit IngestContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Name": 1
    },
    "$offset": 0,
    "$limit": 2
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 2
    Alors les metadonnées pour le résultat 0
      | Name       | ZimbabweArchivalAgreement0  |
      Alors les metadonnées pour le résultat 1
      | Name       | ZimbabweArchivalAgreement0Test  |
      
# Recherche offset / limit IngestContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Name": 1
    },
    "$offset": 1,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 1
      Alors les metadonnées pour le résultat 0
      | Name       | ZimbabweArchivalAgreement0Test  |

# Recherche offset / limit IngestContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Name": 1
    },
    "$offset": 200,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel INGEST_CONTRACTS
    Alors le nombre de résultat est 0

# Recherche offset / limit AccessContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Identifier": 1
    },
    "$offset": 0,
    "$limit": 2
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 2
    Alors les metadonnées pour le résultat 0
      | Identifier       | Zimbabwe_Air_Zimbabwe |
      Alors les metadonnées pour le résultat 1
      | Identifier       | Zimbabwe_Societe_archeologique_du_Zimbabwe  |
      
# Recherche offset / limit AccessContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Identifier": 1
    },
    "$offset": 1,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
      Alors les metadonnées pour le résultat 0
      | Identifier       | Zimbabwe_Societe_archeologique_du_Zimbabwe  |

# Recherche offset / limit AccessContracts *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$and": [
      {
        "$match": {
          "Description": "Zimbabwe"
        }
      }
    ]
  },
  "$filter": {
    "$orderby": {
      "Identifier": 1
    },
    "$offset": 200,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

# Recherche offset / limit AccessionRegister *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$gt": {
      "TotalObjects.ingested": 0
    }
  },
  "$filter": {
    "$orderby": {
      "OriginatingAgency": 1
    },
    "$offset": 0,
    "$limit": 2
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESSION_REGISTERS
    Alors le nombre de résultat est 2

# Recherche offset / limit AccessionRegister *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$gt": {
      "TotalObjects.ingested": 0
    }
  },
  "$filter": {
    "$orderby": {
      "OriginatingAgency": 1
    },
    "$offset": 1,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESSION_REGISTERS
    Alors le nombre de résultat est 1

# Recherche offset / limit AccessionRegister *
    Quand j'utilise la requête suivante
"""
{
  "$query": {
    "$gt": {
      "TotalObjects.ingested": 0
    }
  },
  "$filter": {
    "$orderby": {
      "OriginatingAgency": 1
    },
    "$offset": 2000,
    "$limit": 1
  },
  "$projection": {}
}
"""
    Et je recherche les données dans le référentiel ACCESSION_REGISTERS
    Alors le nombre de résultat est 0
