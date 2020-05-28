#language: fr

@MassUpdate
@massUpdateMddDescriptive
Fonctionnalité: Modifier en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
      Etant donné les tests effectués sur le tenant 0

  ### Modifier ###

  @Light
  Scénario: Modifier une métadonnée descriptive - Titre
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdd_title.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est OK
    Quand je recherche le JCV de l'unité archivistique dont le titre est new_title

  Scénario: Modifier une métadonnée descriptive - Titre avec un nombre maximum de modification (5)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/updateMax_mdd_description.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier plusieurs métadonnée descriptive - Titre et Description
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdd_title_description.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est OK

  Scénario: Modifier une métadonnée descriptive - DescriptionLevel  KO
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdd_descriptionLevel_ko.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est KO
    ## il faut tester également que les modifications sont présentes dans le JCV des AU

  #Scénario: Modifier une métadonnée descriptive sans avoir les droit de modification - KO
    #Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    #Quand je télécharge le SIP
    #Et je recherche le journal des opérations
    #Alors le statut final du journal des opérations est OK
    #Et les tests effectués sur le contrat id contrat_modification_interdites
    #Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdd_description.json
    #Et je lance la mise à jour de masse des units
    #Alors le statut final du journal des opérations est KO
    ## il faut tester également que les modifications sont présentes dans le JCV des AU


