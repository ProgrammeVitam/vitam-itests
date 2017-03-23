# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.
    Etant donné les tests effectués sur le tenant 0

  Scénario: SRC1 - Recherche une archive unit avec un grands interval de temps sur plusieurs tenants
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_SRC1_DATES_EXTREMES_OBJETS.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [
    { "$and": [
        { "$gte": {
            "StartDate": "1914-01-01T23:00:00.000Z"
          } }, {
          "$lte": {
            "EndDate": "1918-12-31T22:59:59.000Z"
          } } ],
      "$depth": 20}],
  "$filter": {
    "$orderby": { "TransactedDate": 1 }
  }, "$projection": {
    "$fields": {
      "TransactedDate": 1, "#id": 1, "Title": 1, "#object": 1, "DescriptionLevel": 1, "EndDate": 1, "StartDate": 1
}}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | Liste des armements |
      | DescriptionLevel | Item                |
      | StartDate        | 1917-01-01          |
      | EndDate          | 1918-01-01          |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: SRC2 - chercher les unités ayant un titre donné et une description contenant au moins un mots clés donnés
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_SRC2_TITLE_DESC_UNITS_SANS_OBJ.zip
    Quand je télécharge le SIP
    Et j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [{ "$or": [{
          "$and": [ {
              "$match": {
                "Title": "Rectorat"
              }},{
              "$match": {
                "Description": "public"
              }}]},{
          "$and": [{
              "$match": {
                "Title": "Rectorat"
              }},{
              "$match": {
                "Description": "privé"
              }}] }],
      "$depth": 20
    }],
  "$filter": {
    "$orderby": {
      "TransactedDate": 1 }
  },
  "$projection": {
    "$fields": {
      "TransactedDate": 1, "#id": 1, "Title": 1, "#object": 1
    }}}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title | Rectorat de Nantes  |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

