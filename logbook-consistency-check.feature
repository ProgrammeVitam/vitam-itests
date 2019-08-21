# language: fr

@CheckConsistency_logbook
Fonctionnalité: vérifier la cohérence des journaux (Opération, LFC unit, LFC GOT)
      Lancer le service de vérification de cohérence de tous les journaux générés par les précédents TNR.
  description

  Contexte:
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

#   to fix later
#  Scénario: Test de vérification de cohérence des logbook
#    Quand je lance le test de cohérence des journaux
#    Alors je verifie que le rapport du test de cohérence des journaux ne contient pas d'erreur

  Scénario: Mise à jour du contextes pour désactivier le controle OK
    Et les tests effectués sur le tenant 1
    Etant donné  un fichier requete nommé data/queries/update/ok/update_context_enable_control_false.json
    Alors je modifie le contexte dont l'identifiant est CT-000001 le statut de la requête est 200
