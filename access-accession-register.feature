# language: fr

@AccessAccessionRegister
Fonctionnalité: Recherche dans les registres de fond

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Scénario: Upload d'un SIP et vérification du contenu dans le registre de fonds
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE.zip
    Quand je télécharge le SIP
		Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_id.json
    Et je recherche les détails des registres de fond pour le service producteur Vitam
    Alors les metadonnées sont
      | OriginatingAgency        | Vitam              |
      | SubmissionAgency         | Vitam              |
      | ArchivalAgreement        | ArchivalAgreement0 |