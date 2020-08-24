# language: fr

@SecurityProfiles
Fonctionnalité: Tests d'imports, de recherches et de MAJ des profiles de sécurité

  Contexte:
    Etant donné les tests effectués sur le tenant 1

  @Light
  Scénario: Import de profile de sécurité OK
    Etant donné un profile de sécurité nommé data/security_profiles/security_profile_ok.json
    Alors j'importe ce profile de sécurité en succès

  Scénario: Import de profile de sécurité KO, car il est en mode FullAccess (toutes permissions) et qu'il définit des permissions unitaires
    Etant donné un profile de sécurité nommé data/security_profiles/security_profile_ko_permissions_with_full_access.json
    Alors j'importe ce profile de sécurité en échec


  Scénario: Vérifier que le profile de sécurité a toutes les permissions
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_1
    Alors le profile de sécurité a toutes les permissions

  Scénario: Vérifier que le profile de sécurité a une permission donnée
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Alors le profile de sécurité contient la permission units:read

  Scénario: Vérifier que le profile de sécurité n'a pas une permission donnée
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Alors le profile de sécurité ne contient pas la permission contexts:read

  Scénario: MAJ du profile de sécurité
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Quand je modifie le profile de sécurité avec le fichier de requête suivant data/queries/update_security_profile.json le statut de la requête est 200
    Alors le profile de sécurité ne contient pas la permission units:read
    Alors le profile de sécurité contient la permission contexts:read

  Scénario: MAJ du profile de sécurité unset permissions et fullaccess KO
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Quand je modifie le profile de sécurité avec le fichier de requête suivant data/queries/update/ko/update_unset_permissions_fullaccess.json le statut de la requête est 400

  Scénario: MAJ du profile de sécurité unset identifier KO
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Quand je modifie le profile de sécurité avec le fichier de requête suivant data/queries/update/ko/update_unset_identifier.json le statut de la requête est 400


  Scénario: MAJ du profile de sécurité fake attribute KO
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Quand je modifie le profile de sécurité avec le fichier de requête suivant data/queries/update/ko/update_set_fake_attribute.json le statut de la requête est 400

  Scénario: MAJ du profile de sécurité unknown permission KO
    Etant donné un profile de sécurité ayant pour nom TNR_SEC_PROFILE_OK_2
    Quand je modifie le profile de sécurité avec le fichier de requête suivant data/queries/update/ko/update_set_unknown_permission.json le statut de la requête est 400
