# language: fr

@AccessAccessionRegister
Fonctionnalité: Recherche dans les registres de fond

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type CONTRACTS

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
