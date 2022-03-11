# language: fr

@Storage
Fonctionnalité: uploader des fichier et verifier qu'ils sont sauvegardés dans les offres de stockages
  Avant de lancer cette suite de test je presupose ques la configuration des clients est bien faite.
  description

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  @Light
  Scénario: Test de stockage
    Etant donné un fichier nommé data/SIP_OK/ZIP/OK-RULES.zip
    Quand je sauvegarde le fichier dans la strategie default
    Alors le fichier est bien stocké dans les strategies suivantes
      | Nom              | valeur    |
      | ofre par default | default |
    Et je verifie que toutes ces strategies contiennent des fichiers
      | Nom              | valeur    |
      | ofre par default | default |


  Scénario: Test de sauvegarde des journaux des écritures
    Quand je lance une sauvegarde des journaux des écritures
    Alors le statut final du journal des opérations est OK


  Scénario: Test de sauvegarde des journaux des logs d'accès
    Quand je lance une sauvegarde des journaux des logs d'accès
    Alors le statut final du journal des opérations est OK
