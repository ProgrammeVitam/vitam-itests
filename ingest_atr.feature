# language: fr

@Ingest
Fonctionnalité: uploader des fichier SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0


  Scénario: Test virus
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et le statut de l'événement SANITY_CHECK_SIP est KO
    Alors je peux télécharger son ATR
