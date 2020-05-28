#language: fr

@MassUpdate
@massDeleteMddDescriptive
Fonctionnalité: Supprimer en masse des métadonnées descriptives d'une AU

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0

  @Light
  Scénario: Supprimer une métadonnée descriptive - Description (champ facultatif)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_mdd_description.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est OK

  @Light
  Scénario: Supprimer une métadonnée descriptive - Titre (champ obligatoire)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_title_mdd_ko.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est KO

  Scénario: Supprimer la métadonnée descriptive Description (champ facultatif) et modifier la métadonnée descriptive Titre (champ obligatoire)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_MODIFICATION_MASSE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_update_DesciptionTitle_mdd_ko.json
    Et je lance la mise à jour de masse des units
    Alors le statut final du journal des opérations est OK
