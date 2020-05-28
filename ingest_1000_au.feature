# language: fr

@Ingest
@Ingest_OG_CHECK_AND_TRANSFORME
Fonctionnalité: 1000 AU
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
  Scénario: Import de contrat de type contract Entree
    Etant donné un contract nommé data/contracts/referential_contracts_ok.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

### OK
  Scénario: Test d'un ingest avec 1000 AU

    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_1000_AU.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est WARNING
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1000
