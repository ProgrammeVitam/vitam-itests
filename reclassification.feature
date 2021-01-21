#language: fr

@Reclassification
Fonctionnalité: Reclassification des unités archivistiques

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0

  @Light
  Scénario: Reclassification d'unités sans blocage de règles de gel OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et je nomme l'identifiant de l'opération InitialOperationId

    Quand j'utilise le fichier de requête suivant data/queries/select_all_units.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 27

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [
      {
        "$in": { "#id": [
          "{{unit:Unit01}}", "{{unit:Unit02}}", "{{unit:Unit03}}", "{{unit:Unit04}}", "{{unit:Unit05}}",
          "{{unit:Unit06}}", "{{unit:Unit07}}", "{{unit:Unit08}}", "{{unit:Unit09}}", "{{unit:Unit11}}",
          "{{unit:Unit12}}", "{{unit:Unit14}}", "{{unit:Unit15}}", "{{unit:Unit17}}", "{{unit:Unit18}}",
          "{{unit:Unit20}}", "{{unit:Unit21}}", "{{unit:Unit23}}", "{{unit:Unit24}}"
        ] }
      }
    ],
    "$action": [
      {
        "$pull": {
          "#unitups": [ "{{unit:RootUnit1}}" ]
        },
        "$add": {
          "#unitups": [ "{{unit:RootUnit2}}" ]
        }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est OK

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 19



  Scénario: Reclassification KO d'unités avec blocage de règles de gel à durée définie non expirée avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit10}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0



  Scénario: Reclassification KO d'unités avec blocage de règles de gel sans durée, et sans HoldEndDate avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit13}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0



  Scénario: Reclassification KO d'unités avec blocage de règles de gel à durée illimitée avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit16}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0




  Scénario: Reclassification KO d'unités avec blocage de règles de gel à durée définie sans StartDate avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit19}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0



  Scénario: Reclassification KO d'unités avec blocage de règles de gel sans durée définie avec StartDate et sans HoldEndDate avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit22}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0


  Scénario: Reclassification KO d'unités avec blocage de règles de gel illimité sans StartDate avec PreventRearrangement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/RECLASSIFICATION_HOLD_RULES_COMPLEX.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING

    Quand j'utilise la requête suivante
"""
[
  {
    "$roots": [],
    "$query": [ { "$eq": { "#id": "{{unit:Unit25}}" } } ],
    "$action": [
      {
        "$pull": { "#unitups": [ "{{unit:RootUnit1}}" ] },
        "$add": { "#unitups": [ "{{unit:RootUnit2}}" ] }
      }
    ]
  }
]
"""
    Et je lance l'opération de reclassification
    Et je nomme l'identifiant de l'opération ReclassificationOperationId
    Alors le statut final du journal des opérations est KO

    Et j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$in":{"#operations":["Named-Operation-Id<ReclassificationOperationId>"]}}],
  "$projection": {}
}
"""
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
