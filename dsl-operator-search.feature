#language: fr

@DslOperatorSearch
Fonctionnalité: Test operateur SEARCH du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test opérateur $search
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_search.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "Faire cuire les courgettes"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
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
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "abracadabra"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
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
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "\"Faire cuire les courgettes\""}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
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
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "\"Faire cuire les courgettes\" abracadabra"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
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
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "\"Faire cuire les courgettes\" + abracadabra"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
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
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$search" : { "Description": "\"Faire cuire les courgettes\" + -abracadabra"}
                    }
               ]
          }
     ],
     "$projection": {
          "$fields": { "#id": 1 }
     }
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 2
