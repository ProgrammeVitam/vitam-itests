# language: fr

@Dip
Fonctionnalité: Export DIP

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0

  @Light
  Scénario: Test export dip unit then OK
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$eq": { "#opi": "Operation-Id" } }
  ],
  "$filter": {},
  "$projection": {}
}
"""
    Quand j'exporte le dip
    Alors le statut final du journal des opérations est OK
    Quand je télécharge le dip
    Alors le dip contient 3 unités archivistiques
    Alors le dip contient 2 groupes d'objets
    Alors le dip contient 2 objets dont 2 sont binaires



  @Light
  Scénario: Test export dip with no unit then KO
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$eq": { "#opi": "anything" } }
  ],
  "$filter": {},
  "$projection": {}
}
"""
    Quand j'exporte le dip
    Alors le statut final du journal des opérations est KO


  Scénario: Test export dip avec un seuil de requête < taille du sip
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_Mercier.zip
    Quand j'utilise la requête suivante
"""
{
  "dataObjectVersionToExport" : {
    "DataObjectVersions" : [ "BinaryMaster" ]
  },
  "exportType" : "MinimalArchiveDeliveryRequestReply",
  "exportWithLogBookLFC" : true,
  "dslRequest" : {
    "$roots" : [ ],
    "$query" : [ {
      "$in" : {
        "#operations" : [ "Operation-Id" ]
      }
    } ],
    "$filter" : { },
    "$projection" : { },
    "$facets" : [ ]
  },
  "maxSizeThreshold": 1000
}
"""
    Quand j'exporte le DIP
    Alors le statut final du journal des opérations est KO
