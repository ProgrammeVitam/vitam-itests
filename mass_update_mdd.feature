#language: fr

@massUpdateMddDescriptive
Fonctionnalité: Modification en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès


    Scénario: Modifier une métadonnée descriptive
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip

  ### Modification ###
    ## Titre
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_title.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK

    ## Description
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_description.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## Dates
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_dates.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## DescriptionLevel
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_update_mdd_descriptionLevel.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## Titre avec un nombre maximum de modification (5)
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_updateMax_mdd_description.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK

  ### Ajout ###
    ## Ajouter - Titre
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_mdd_title.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## Ajouter - BirthName du Writer [vocabulaire interne de l'ontologie]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_mdd_birthName.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## Ajouter - MyText [vocabulaire externe de l'ontologie]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_mdd_myText.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU

    ## Ajouter - MyText [vocabulaire externe de l'ontologie]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_mdd_myText.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est OK
        ## il faut tester également que les modifications sont présentes dans le JCV des AU


   ### Cas KO d'ajout avec un mauvais type ###
    ## Ajouter - MyBoolean [cas 1 : MyBoolean = string]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_string_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter - MyBoolean [cas 2 : array / keyword]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_array_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter - MyBoolean [MyBoolean = date [cas 1 : date normée]]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_dateNorme_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter - MyBoolean [MyBoolean = date [cas 2 : date avec slash]]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_dateSlash_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter - MyBoolean [MyBoolean = décimal / Double]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_decimal_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter- MyBoolean [MyBoolean = décimal / Double [cas 2 : décimal avec point]]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myboolean_double_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO

    ## Ajouter - MyDate [MyDate = string]]
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_add_myDate_string_ko.json
        Et je lance la mise à jour de masse des units
        Alors le statut final du journal des opérations est KO