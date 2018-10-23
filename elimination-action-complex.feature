#language: fr

@DslOperatorIn
Fonctionnalité: Test workflow d'analyse de l'élimination multi services producteurs

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Workflow d'action d'élimination multi-services producteurs
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/EliminationAction-RATP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et je nomme l'identifiant de l'opération OperationIdRATP
    Quand j'utilise la requête suivante
"""
{
  "$roots": [],
  "$query": [
    {
      "$and": [
        {"$in":{"#opi":["Operation-Id"]}},
        {"$eq":{"Title": "Denfert-Rochereau (ligne B)"}}
      ]
    }
  ],
  "$projection": {}
}
"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/EliminationAction-SNCF.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et je nomme l'identifiant de l'opération OperationIdSNCF

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 20










    ### Avant toute élimination, résultat = 20

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2013-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$eq":{"Title":"Etampes"}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2013-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$in":{"#opi":["Named-Operation-Id<OperationIdSNCF>", "Named-Operation-Id<OperationIdRATP>"]}},
            {"$eq":{"Title":"Etampes"}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 19










  ### Après élimination en 2013, résultats = 19

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2014-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$eq":{"Title":"Chamarande"}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2014-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$in":{"#opi":["Named-Operation-Id<OperationIdSNCF>", "Named-Operation-Id<OperationIdRATP>"]}},
            {"$eq":{"Title":"Chamarande"}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 18









  ### Après élimination en 2014, résultats = 18

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2015-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$eq":{"Title":"Arpajon"}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2015-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 18










  ### Après élimination en 2015, résultats = 18

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2016-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 2

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$in":{"Title":["Dourdan", "Arpajon"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 2

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2016-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$in":{"#opi":["Named-Operation-Id<OperationIdSNCF>", "Named-Operation-Id<OperationIdRATP>"]}},
            {"$in":{"Title": ["Dourdan", "Arpajon"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 16










  ### Après élimination en 2016, résultats = 16

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2017-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 7

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$eq":{"#elimination.GlobalStatus":"DESTROY"}},
            {"$in":{"Title":["Gare de Lyon", "Gare d'Austerlitz", "Juvisy", "Brétigny", "Viry Chatillon", "Evry"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 6

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$eq":{"#elimination.GlobalStatus":"CONFLICT"}},
            {"$in":{"Title":["Massy Palaiseau"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1



    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2017-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$in":{"#opi":["Named-Operation-Id<OperationIdSNCF>", "Named-Operation-Id<OperationIdRATP>"]}},
            {"$in":{"Title": ["Brétigny"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 15










  ### Après élimination en 2017, résultats = 15

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une analyse d'élimination avec pour date le 2018-01-02 qui se termine avec le statut OK

    Et j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 7

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [
        {
         "$and": [
            {"$eq":{"#elimination.OperationId":"Elimination-Operation-Id"}},
            {"$in":{"Title":["Denfert-Rochereau (ligne B)", "Gare d'Austerlitz", "Gare de Lyon", "Juvisy", "Massy Palaiseau", "Viry Chatillon", "Evry"]}}
          ]
        }
      ],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 7

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}]}
    """
    Et je lance une élimination définitive avec pour date le 2018-01-02 qui se termine avec le statut WARNING

    Quand j'utilise la requête suivante
    """
    {"$roots": [],
      "$query": [{"$in":{"#opi":["Named-Operation-Id<OperationIdRATP>", "Named-Operation-Id<OperationIdSNCF>"]}}],
      "$projection": {}}
    """
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 15
