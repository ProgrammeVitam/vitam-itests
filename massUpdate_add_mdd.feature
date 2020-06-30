#language: fr

@MassUpdate
@massAddMddDescriptive
Fonctionnalité: Ajouter en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip

  ### Ajouter ###

    @Light
    Scénario: Ajouter une métadonnée descriptive - Titre
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_mdd_title.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Ajouter une métadonnée descriptive - StartDate < EndDate
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_startDate_post_endDate_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - StartDate au mauvais format
         Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_startDate_wrongFormat_ko.json
         Et je lance la mise à jour de masse des units
         Alors le statut final du journal des opérations est WARNING

    ## Ontologie

   Scénario: Ajouter une métadonnée descriptive - BirthName du Writer [vocabulaire interne de l'ontologie]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_mdd_birthName.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

    Scénario: Ajouter une métadonnée descriptive - MyText [vocabulaire externe de l'ontologie]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_mdd_myText.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
      ## il faut tester également que les modifications sont présentes dans le JCV des AU

   ### Cas KO d'ajout avec un mauvais type ###
    @Light
    Scénario: Ajouter une métadonnée descriptive - MyBoolean [cas 1 : MyBoolean = string]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_string_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive -MyBoolean [cas 2 : array / keyword]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_array_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyBoolean [MyBoolean = date [cas 1 : date normée]]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_dateNorme_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyBoolean [MyBoolean = date [cas 2 : date avec slash]]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_dateSlash_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyBoolean [MyBoolean = décimal / Double]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_decimal_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyBoolean [MyBoolean = décimal / Double [cas 2 : décimal avec point]]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myboolean_double_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDate [MyDate = string]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDate_string_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 1 : [MyDouble = string]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_string_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 2 : ["MyDouble [Array 1]", "MyDouble [Array 2]"]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_array_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 3 : [MyDouble = "2016-10-12T16:28:40"]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_dateNorme_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 4 : [MyDouble = "2016/10/12"]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_date_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 5 : [MyDouble = "true"]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_boolean_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une valeur inexistante au champ DecriptionLevel
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_fakeValueDescriptionLevel_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une valeur vide au champ DecriptionLevel
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_blankValueDescriptionLevel_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est WARNING

    Scénario: Ajouter une métadonnée descriptive - MyDouble Cas 6 : [MyDouble = "40"]
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_myDouble_stringNumber_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK
