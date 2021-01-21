#language: fr

@BulkAtomicUpdateDescriptive
Fonctionnalité: Modification unitaire de masse de métadonnées descriptives d'AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE_BULK.zip

  @Light
  Scénario: Modifier plusieurs métadonnées descriptives sur plusieurs unités archivistiques, en indiquant un threshold
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_global_ok.json
    Et je lance la mise à jour unitaire de masse des units
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier plusieurs métadonnées descriptives sur plusieurs unités archivistiques, sans indiquer de threshold
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_global_ok_no_custom_threshold.json
    Et je lance la mise à jour unitaire de masse des units
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant une requete sélectionnant plusieurs unités
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_too_many_results_process_warning_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements PREPARE_BULK_ATOMIC_UPDATE_UNIT_LIST, BULK_ATOMIC_UPDATE_FINALIZE sont WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant une requete ne sélectionnant aucune unité
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_no_results_process_warning_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements PREPARE_BULK_ATOMIC_UPDATE_UNIT_LIST, BULK_ATOMIC_UPDATE_FINALIZE sont WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant une requete modifiant une propriete interne
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_set_internal_property_prepare_warning_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements PREPARE_BULK_ATOMIC_UPDATE_UNIT_LIST, BULK_ATOMIC_UPDATE_FINALIZE sont WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant une requete aboutissant sur un ko lors de l'update
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_some_bad_requests_process_warning_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et le statut de l'événement BULK_ATOMIC_UPDATE_UNITS est KO
    Et le statut de l'événement BULK_ATOMIC_UPDATE_FINALIZE est WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant seulement des requetes aboutissant sur un ko lors de l'update
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_all_bad_requests_process_ko_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et le statut de l'événement BULK_ATOMIC_UPDATE_UNITS est KO
    Et le statut de l'événement BULK_ATOMIC_UPDATE_FINALIZE est WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant une requete pour laquelle l'unité n'a pas besoin d'etre mise à jour
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_no_change_process_ok_global_ok.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements BULK_ATOMIC_UPDATE_UNITS, BULK_ATOMIC_UPDATE_FINALIZE sont OK

  Scénario: Modifier plusieurs métadonnées descriptives, en incluant seulement des requetes de sélection incorrectes, n'aboutissant à la mise à jour d'aucune unité
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_no_update_prepare_warning_process_warning_global_warning.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et les statuts des événements PREPARE_BULK_ATOMIC_UPDATE_UNIT_LIST, OBJECTS_LIST_EMPTY, BULK_ATOMIC_UPDATE_FINALIZE sont WARNING

  Scénario: Modifier plusieurs métadonnées descriptives, avec un threshold inférieur au nombre de requetes fournies
    ### Modification ###
    ## Description
    Quand j'utilise le fichier de requête suivant data/queries/bulk-atomic-update/update_mdd_custom_threshold_overcomed_check_ko_global_ko.json
    Et je lance la mise à jour unitaire de masse des units
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement CHECK_QUERIES_THRESHOLD est KO
    Et le statut de l'événement BULK_ATOMIC_UPDATE_FINALIZE est WARNING