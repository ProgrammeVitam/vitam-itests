# language: fr

@Audit
Fonctionnalité: Audit de l'existence des objets
  Contexte: Avant de lancer cette suite de test, je présuppose que un contrat d'accès est chargé.
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
  
  Scénario: contrôler l'existence d'objet en Service producteur
    Etant donné les tests effectués sur le tenant 0
    Quand je veux faire l'audit des objets du service producteur "ABCDEFG"
    Quand je veux faire l'audit des objets de tenant 0
    Alors le réultat de l'audit est succès

