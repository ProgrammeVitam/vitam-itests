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
  Scénario: Import dans collect d'un SIP avec 1000 AU

    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP_1000_AU.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Quand j'utilise le fichier de requête suivant data/queries/select_all_units_any_operation.json
    Et je recherche les unités archivistiques de la transaction
    Alors le nombre de résultat est 1000
