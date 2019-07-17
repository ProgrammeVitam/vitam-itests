#language: fr

@massUpdateMddDescriptive
Fonctionnalité: Modifier en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip

  ### Modifier ###

    Scénario: Modifier une métadonnée descriptive - Titre
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_title.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK

    Scénario: Modifier une métadonnée descriptive - Description
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_description.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Modifier une métadonnée descriptive - Dates
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_dates.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Modifier une métadonnée descriptive - DescriptionLevel
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_descriptionLevel.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Modifier une métadonnée descriptive - Titre avec un nombre maximum de modification (5)
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_updateMax_mdd_description.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK

    Scénario: Modifier plusieurs métadonnée descriptive - Titre et Description
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_title_description.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK

    Scénario: Modifier une métadonnée descriptive - DescriptionLevel  KO
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_descriptionLevel_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est KO
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Modifier une métadonnée descriptive sans avoir les droit de modification - KO
      Et les tests effectués sur le contrat id contrat_modification_interdites
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_description.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est KO
      ## il faut tester également que les modifications sont présentes dans le JCV des AU