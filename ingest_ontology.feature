# language: fr

@Ingest
@Ingest_Ontology
Fonctionnalité: Ontology test
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

### OK
  @Light
  Scénario: Test d'un ingest avec une date au format "2016-09-26Z" (pour transformation)

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_DATE_SHOULD_TRANSFORM_PASS.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Date Format z"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {
  }}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
    | Writer.BirthDate        | 2016-09-26                                  |

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$eq":{"#operations":"Operation-Id"}}],
  "$projection": {
  }}
"""
     Et je recherche les groupes d'objets
     Alors les metadonnées sont
     | #qualifiers.1.versions.0.FileInfo.LastModified        | 2016-10-18T21:03:30                                 |
