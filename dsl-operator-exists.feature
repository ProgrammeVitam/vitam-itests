#language: fr

@DslOperatorIn
Fonctionnalité: Test operateur EXISTS / MISSING du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test opérateur $exists / $missing
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
               "$exists": "vide",
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
               "$exists": "Title",
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
               "$missing": "vide",
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
               "$exists": "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3",
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
               "$missing": "DataInTestTab0.DataInTestTab1.DataInTestTab2.DataInTestTab3",
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
               "$exists": "DataInTestTab0.DataInTestTab1",
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
