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
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 1
    Et les metadonnées pour le détail du registre de fond sont
      | OriginatingAgency           | producteur1 |
      | OpType                      | PRESERVATION |
      | Status                      | STORED_AND_COMPLETED |
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_objects_by_Title.json
    Et je recherche les groupes d'objets
    Alors  le type du binaire généré est un BinaryMaster et de type image/gif
    Quand je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est Gallieni par producteur1
    Alors les statuts des événements LFC.PRESERVATION_SIEGFRIED_IDENTIFICATION, LFC.PRESERVATION_BINARY_HASH, LFC.PRESERVATION_STORAGE_BINARY, LFC.PRESERVATION_INDEXATION_METADATA sont OK





  Scénario: Lancer une opération de préservation sur un PhysicalMaster inexistant
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title.json
    Quand je lance la preservation avec le scénario PSC-000001 et pour l'usage PhysicalMaster
    Alors le statut final du journal des opérations est WARNING
    Et le champ 'outMessg' de l'évenement final est : Avertissement lors du processus global de préservation
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 0
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_objects_by_Title.json
    Et je recherche les groupes d'objets
    Alors  Le fichier binaire du type du qualifier BinaryMaster n'a pas été généré


  Scénario: Lancer une opération de préservation avec un scénario de préservation inexistant
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title.json
    Quand je lance la preservation avec le scénario test et pour l'usage BinaryMaster
    Alors le statut final du journal des opérations est FATAL
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 0
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_objects_by_Title.json
    Et je recherche les groupes d'objets
    Alors Le fichier binaire du type du qualifier BinaryMaster n'a pas été généré


  Scénario: Lancer une opération de validation préservation sur un BinaryMaster
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title_OK_PDF.json
    Quand je lance la preservation du scénario PSC-000002 pour l'usage d'entrée BinaryMaster et pour l'usage de sortie BinaryMaster
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 0


  Scénario: Lancer une opération d'identification préservation sur un BinaryMaster
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title_OK_PDF.json
    Quand je lance la preservation du scénario PSC-000006 pour l'usage d'entrée BinaryMaster et pour l'usage de sortie BinaryMaster
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 0



  Scénario: Lancer une opération d'extraction préservation sur un BinaryMaster
    Etant donné les tests effectués sur le tenant 1
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_by_Title_OK_PDF.json
    Quand je lance la preservation du scénario PSC-000004 pour l'usage d'entrée BinaryMaster et pour l'usage de sortie TextContent
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    { "$in": {
        "#operations": [
          "Operation-Id"
        ]
      } }
  ],
  "$projection": { }
}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées pour le résultat 0
      | TextContent                      | Variatio Ipsius |
    Quand j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 0
    Quand j'utilise le fichier de requête suivant data/queries/preservation/select_objects_by_Title.json
    Et je recherche les groupes d'objets
    Et je recherche le JCV du groupe d'objet de l'unité archivistique dont le titre est fichier PDF/A
    Alors Le fichier binaire du type du qualifier BinaryMaster n'a pas été généré
    Et les statuts des événements LFC.PRESERVATION_EXTRACTION_AU sont OK


