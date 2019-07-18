#language: fr

@massDeleteMddDescriptive
Fonctionnalité: Supprimer en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip


    Scénario: Supprimer une métadonnée descriptive - Description (champ facultatif)
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_delete_mdd_description.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK

    Scénario: Supprimer une métadonnée descriptive - Titre (champ obligatoire)
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_delete_title_mdd_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est KO

    Scénario: Supprimer la métadonnée descriptive Description (champ facultatif) et modifier la métadonnée descriptive Titre (champ obligatoire)
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/mass_modif_delete_update_DesciptionTitle_mdd_ko.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK


    Scénario: Supprimer la StartDate d'une catégorie de règle
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_startDateCategoryRule.json
      Et je lance la mise à jour de masse des units
      Alors le statut final du journal des opérations est OK