# language: fr

@Dip
Fonctionnalité: Demo

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0

  @Light
  Scénario: Test demo
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/3_UNITS_2_GOTS.zip
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


    
