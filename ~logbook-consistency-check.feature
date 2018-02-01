# language: fr

@CheckConsistency_logbook
Fonctionnalité: vérifier la cohérence des journaux (Opération, LFC unit, LFC GOT)
      Lancer le service de vérification de cohérence de tous les journaux générés par les précédents TNR.
  description

  Contexte:
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Test de vérification de cohérence des logbook
    Quand je lance le test de cohérence des journaux
    Alors je verifie que la strategie contient le rapport de cohérence
            | Nom              | valeur    |
            | ofre par default | default |
