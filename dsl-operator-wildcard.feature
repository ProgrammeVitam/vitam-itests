#language: fr

@Dsl
@DslOperatorWildcard
Fonctionnalité: Test operateur WILDWARD du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Test opérateur $wildcard
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    
# Recherche complète *
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "*"}
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
    Alors le nombre de résultat est 17

# Recherche exacte
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "Item"}
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
    Alors le nombre de résultat est 10


# Recherche par prefixe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "It*"}
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
    Alors le nombre de résultat est 10

# Recherche par suffixe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "*em"}
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
    Alors le nombre de résultat est 10

# Recherche en milieu de mot
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "I*m"}
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
    Alors le nombre de résultat est 10

# Recherche partielle
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "te"}
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

# Recherche wilcard complexe
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "*I?e*m*"}
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
    Alors le nombre de résultat est 10

# Recherche wilcard complexe sans résultat
    Quand j'utilise la requête suivante
"""
{
     "$roots": [],
     "$query": [
          {
               "$and": [
                    { "$in": { "#operations": [ "Operation-Id" ] } },
                    {
                        "$wildcard" : { "DescriptionLevel": "?fffff*"}
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

