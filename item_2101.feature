# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Recherche une archive unit qui contient le letter tokenizer
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2101/OK_SIP_2101.zip
    Quand je télécharge le SIP
    Et j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        {
          "$match": {
            "Description": "17"
          }
        }
      ],
      "$depth": 20
    }
  ],
  "$filter": {
    "$orderby": {
      "TransactedDate": 1
    }
  },
  "$projection": {
    "$fields": {
      "TransactedDate": 1,
      "#id": 1,
      "Title": 1
    }
  }
}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	      | Title            | BAD0431E2C5E80E5BD42D547A3ED59665555.odt |
