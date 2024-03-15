# language: fr

@Access
@ArchiveUnit
@RuleCalculationComplete
Fonctionnalité: Calcul des règles de gestion sur jeu de test complexe complet

Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Recherche une archive unit avec les règles héritées (1_Saint Denis Université)
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/InheritedRules-SIP-Ambassade de France en Ruritanie.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et je nomme l'identifiant de l'opération OperationId1
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        {"$in":{"#opi":["Named-Operation-Id<OperationId1>"]}},
        {"$eq":{"Title": "Ambassade_de_France_en_Ruritanie"}}
      ]
    }
  ],
  "$projection": {}
}
"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/InheritedRules-SIP-Direction des français à l'étranger.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et je nomme l'identifiant de l'opération OperationId2
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        {"$in":{"#opi":["Named-Operation-Id<OperationId1>"]}},
        {"$eq":{"Title": "Service_politique"}}
      ]
    }
  ],
  "$projection": {}
}
"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/InheritedRules-SIP-Pouvoir législatif.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et je nomme l'identifiant de l'opération OperationId3
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        {"$in":{"#opi":["Named-Operation-Id<OperationId1>"]}},
        {"$eq":{"Title": "Ambassade_de_France_en_Ruritanie"}}
      ]
    }
  ],
  "$projection": {}
}
"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/InheritedRules-SIP-Service économique.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et je nomme l'identifiant de l'opération OperationId4

    Quand j'utilise la requête suivante
"""
{"$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<OperationId1>", "Named-Operation-Id<OperationId2>", "Named-Operation-Id<OperationId3>", "Named-Operation-Id<OperationId4>"]}}],
  "$projection": {}}
"""
    Et je recherche les unités archivistiques avec leurs règles de gestion héritées
    Alors les règles hérités de l'unité Ambassade_de_France_en_Ruritanie correspondent au fichier json inheritedRules/DefaultFinalActionKeep-Ambassade_de_France_en_Ruritanie.json
    Alors les règles hérités de l'unité Pouvoir législatif correspondent au fichier json inheritedRules/DefaultFinalActionKeep-PouvoirLegislatif.json
    Alors les règles hérités de l'unité Service économique correspondent au fichier json inheritedRules/DefaultFinalActionKeep-ServiceEconomique.json
    Alors les règles hérités de l'unité Direction_des_français_à_l'étranger correspondent au fichier json inheritedRules/DefaultFinalActionKeep-DirectionDesFrançaisALEtrange.json
    Alors les règles hérités de l'unité Service consulaire correspondent au fichier json inheritedRules/DefaultFinalActionKeep-ServiceConsulaire.json
