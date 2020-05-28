# language: fr

@Access
@ArchiveUnit
Fonctionnalité: Vérification du respect des permissions liées à la mise à jour d'une unité archivistique en utilisant un contrat d'accès spécifique

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/access/contrats_acces_permission.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  @Light
  Scénario: Vérifier la possibilité de mise à jour globale lorsque le contrat d'accès le permet
    Etant donné les tests effectués sur le tenant 0
    Et J'utilise le contrat d'access AllUpdatesAllowed
    Et un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_SRC2_TITLE_DESC_UNITS_SANS_OBJ.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_01
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1

  Scénario: Vérifier la possibilité de mise à jour des métadonnées de gestion lorsque le contrat d'accès le permet
    Etant donné les tests effectués sur le tenant 0
    Et J'utilise le contrat d'access AllUpdatesAllowed
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
    {"$unset":
              ["#management.AccessRule"]
    }]}
"""
    Et le statut de la requete est OK

  Scénario: Vérifier la possibilité de mise à jour des métadonnées descriptives lorsque le contrat d'accès ne permet que ca
    Etant donné les tests effectués sur le tenant 0
    Et J'utilise le contrat d'access OnlyDescUpdateAllowed
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
    {"$set": {
            "Description": "Rectorat de Seine-Et-Marne"
        }}]}
"""
    Et le statut de la requete est OK

  Scénario: Vérifier l'impossibilité de mise à jour lorsque le contrat d'accès ne le permet pas
    Etant donné les tests effectués sur le tenant 0
    Et J'utilise le contrat d'access NoUpdatesAllowed
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
    {"$set": {
            "Description": "Rectorat de Seine-Et-Marne"
        }}]}
"""
    Et le statut de la requete est Unauthorized
