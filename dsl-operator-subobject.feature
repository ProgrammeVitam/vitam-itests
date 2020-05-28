# language: fr

@Dsl
@DslOperatorSubobject
Fonctionnalité: DSL test opérateur subobject (nested)

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Dsl operator $subobject sur les objets techniques
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_subobject.json
    Et je recherche les groupes d'objets
    Alors le nombre de résultat est 4
