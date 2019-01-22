# language: fr

@Griffins_referential
Fonctionnalité: Import du referentiel griffons

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1

  Scénario: import griffons a deux éléments
    Quand j'importe le griffon nommé data/griffins/OK_griffons_referentiel.json
    Alors les metadonnées sont
      | Code | 201 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du référentiel des griffons


  Scénario: import avec mis à jour intitulé
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_intitule.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
      | Name        | ImageMagick BLABLA |

