#language: fr

@RevertUpdate
@revertUpdateMddEssentielles
Fonctionnalité: Restauration des métadonnées essentielles des AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0

  ### Modifier ###

  @Light
  Scénario: Restaurer une métadonnée descriptive - Title puis Description_.fr
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_REVERT_METADATA.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdd_title_description_fr.json
    Et je lance la mise à jour de masse des units
    Et je nomme l'identifiant de l'opération UpdateOperationId
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/revert-update/revert_update_title.json
    Et je lance la restauration des métadonnées essentielles des AU
    Alors le statut final du journal des opérations est OK
    Quand je recherche le JCV de l'unité archivistique dont le titre est Fracture
    Quand j'utilise le fichier de requête suivant data/queries/revert-update/revert_update_description_fr.json
    Et je lance la restauration des métadonnées essentielles des AU
    Alors le statut final du journal des opérations est KO
    Quand j'utilise le fichier de requête suivant data/queries/revert-update/force_revert_update_description_fr.json
    Et je lance la restauration des métadonnées essentielles des AU
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
    """
    {
         "$roots": [],
         "$query": [
             { "$in": { "#operations": [ "Operation-Id" ] } }
         ],
         "$projection": {}
    }
    """
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | Fracture |
      | Description_.fr  | Description fran\u00E7ais |
