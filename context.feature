# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contexte (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de contexte OK
    Etant donné un contexte nommé data/contexts/contexts_empty.json
    Alors j'importe ce contexte en succès

  Scénario: Import de contexte KO, car il contient contrat d'entrée ou contrat d'acceès invalide
    Etant donné un contexte nommé data/contexts/contexts_error.json
    Alors j'importe ce contexte en échec

  Scénario: Update de contexte
    Etant donné un contract nommé data/contracts/contrats_acces_ok.json
    Alors j'importe ce contrat de type ACCESS_CONTRACTS
    Quand je modifie le contexte avec le fichier de requête suivant data/queries/update_context.json
    Alors le contexte contient un contrat AC-000001
