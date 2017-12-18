# language: fr

@AccessArchiveUnit
Fonctionnalité: Mise à jour d'une unité archivistique

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: UPDATE1 : vérifier la bonne modification du titre et d'une description d'une unité d'archive
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_SRC2_TITLE_DESC_UNITS_SANS_OBJ.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_01
    Alors les metadonnées sont
      | Title            | Liste des rectorats |
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1

  Scénario: UPDATE2 : vérifier la bonne modification des rêgles de gestion
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_unit_by_title_pere_lachaise.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_rules.json
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1
