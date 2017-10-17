# language: fr

@ErrorMessageCheckDigest
Fonctionnalité: Vérifier les messages d'erreur
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type ENTRY_CONTRACTS

  Scénario: Empreinte vide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/DIGEST_VIDE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.EMPTY.KO

  Scénario: Empreinte invalide
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/DIGEST_INVALIDE.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement CHECK_DIGEST est CHECK_DIGEST.INVALIDE.KO
