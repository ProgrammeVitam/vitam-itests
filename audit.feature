# language: fr

@Audit
Fonctionnalité: Audit 
  Contexte: Avant de lancer cette suite de test, je présuppose que un contrat d'accès est chargé.
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
  
  Scénario: contrôler l'existence d'objet par Service producteur
    Etant donné les tests effectués sur le tenant 0
    Quand je veux faire un audit sur l'existence des objets par service producteur "ABCDEFG"
    Alors le réultat de l'audit est succès

  Scénario: contrôler l'intégrité d'objet par Service producteur
    Etant donné les tests effectués sur le tenant 0
    Quand je veux faire un audit sur l'intégrité des objets par service producteur "ABCDEFG"
    Alors le réultat de l'audit est succès



