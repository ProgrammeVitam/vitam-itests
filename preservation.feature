# language: fr

@Preservation
Fonctionnalité: Lancement d'opérations de préservation

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 1


  Scénario: Test import Griffon
    Etant donné les tests effectués sur le tenant 1
    Quand j'importe le griffon nommé data/griffins/OK_griffons_referentiel.json
    Alors les metadonnées sont
      | Code | 201 |
    Et le statut final du journal des opérations est OK


  Scénario: Test import des scénario de préservation
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/OK_scenario_liste.json
    Alors les metadonnées sont
      | Code | 201 |
    Et le statut final du journal des opérations est OK


  Scénario: Test search griffon
    Etant donné les tests effectués sur le tenant 1
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
      | Name        | Griffon 1 : ImageMagick |
      | Identifier  | GRI-000001              |


  Scénario: Test search scénario de préservation
    Etant donné les tests effectués sur le tenant 1
    Quand je cherche le scénario de preservation nommé PSC-000001
    Et les metadonnées sont
      | Name        | Tranformation en GIF |
      | Identifier  | PSC-000001           |


  Scénario: Ingest d'un SIP
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK


  Scénario: Lancer une opération de préservation sur un BinaryMaster
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title.json
    Quand je lance la preservation avec le scénario PSC-000001 et pour l'usage BinaryMaster
    Alors le statut final du journal des opérations est OK


  Scénario: Lancer une opération de préservation sur un PhysicalMaster inexistant
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title.json
    Quand je lance la preservation avec le scénario PSC-000001 et pour l'usage PhysicalMaster
    Alors le statut final du journal des opérations est WARNING
    Et le champ 'outMessg' de l'évenement final est : Avertissement lors du processus global de préservation


  Scénario: Lancer une opération de préservation avec un scénario de préservation inexistant
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title.json
    Quand je lance la preservation avec le scénario test et pour l'usage BinaryMaster
    Alors le statut final du journal des opérations est FATAL

