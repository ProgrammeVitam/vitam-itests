# language: fr

@Collect
@CollectIngest
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Contexte: Projet existant dans collect
    Étant donné Le module de collect est deployé
    Et les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et que j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et que j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et que le projet est créé en succès

### OK
  @Light
  Scénario: Import dans collect d'un SIP avec une date au format "2016-09-26Z" (pour transformation)

    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_DATE_SHOULD_TRANSFORM_PASS.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Date Format z"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  }}
"""
    Et je recherche les unités archivistiques de la transaction
    Alors les metadonnées sont
    | Writer.BirthDate        | 2016-09-26                                  |
