# language: fr

@Referential
Fonctionnalité: Mise à jour des référentielles

  Contexte: Avant de lancer cette suite de test, je présuppose que les référentiels à mettre à jour existent déjà.
    Etant donné les tests effectués sur le tenant 1

### Update Access Contract
  Scénario: MAJ du contrat d'accès unset identifier KO
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ContratTNR
    Quand je modifie un contrat de type ACCESS_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_identifier.json le statut de la requête est 400

  Scénario: MAJ du contrat d'accès unset status KO
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ContratTNR
    Quand je modifie un contrat de type ACCESS_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_status.json le statut de la requête est 400

  Scénario: MAJ du contrat d'accès unset creation date KO
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ContratTNR
    Quand je modifie un contrat de type ACCESS_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_creationdate.json le statut de la requête est 400

  Scénario: MAJ du contrat d'accès set fake attribute KO
    Etant donné un profile de sécurité ayant pour nom ContratTNR
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ContratTNR
    Quand je modifie un contrat de type ACCESS_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_attribute.json le statut de la requête est 400

  Scénario: MAJ du contrat d'accès set fake status KO
    Et je cherche un contrat de type ACCESS_CONTRACTS et nommé ContratTNR
    Quand je modifie un contrat de type ACCESS_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_status.json le statut de la requête est 400


### Update Ingest Contract
  Scénario: MAJ du contrat d'entrèe unset identifier KO
    Et je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Quand je modifie un contrat de type INGEST_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_identifier.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe unset status KO
    Et je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Quand je modifie un contrat de type INGEST_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_status.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe unset creation date KO
    Et je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Quand je modifie un contrat de type INGEST_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_unset_creationdate.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe set fake attribute KO
    Et je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Quand je modifie un contrat de type INGEST_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_attribute.json le statut de la requête est 400

  Scénario: MAJ du contrat d'entrèe set fake status KO
    Et je cherche un contrat de type INGEST_CONTRACTS et nommé ArchivalAgreement0
    Quand je modifie un contrat de type INGEST_CONTRACTS avec le fichier de requête suivant data/queries/update/ko/update_set_fake_status.json le statut de la requête est 400
