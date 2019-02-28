# language: fr

@logbook_external
Fonctionnalité: vérifier la possibilité d'intégrer des journaux depuis l'extérieur
  description

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Test d'insertion d'un journal d'opération externe OK
    Etant donné un fichier de logbook operation nommé data/external_logbook/OK_external_logbook.json
    Et j'importe un journal d'opération correct
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le champ 'evTypeProc' de l'évenement final est : EXTERNAL
    Et le champ 'outMessg' de l'évenement final est : External Random operation succeeded
    Et le champ 'outDetail' de l'évenement final est : EXTERNAL_RANDOM_OPERATION.OK
    
  Scénario: Test d'insertion d'un journal d'opération externe KO (evTypeProc est incorrect)
    Etant donnée un fichier de logbook operation nommé data/external_logbook/KO_external_logbook_incorrect_evTypeProc.json
    Et j'importe un journal d'opération incorrect
    
