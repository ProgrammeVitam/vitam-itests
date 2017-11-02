# language: fr

@Test
Fonctionnalité: Unit : Test  de protection  d'api


  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json

  Scénario: Initial
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_SRC2_TITLE_DESC_UNITS_SANS_OBJ.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_01
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1


  Scénario: OK_UPDATE_UNIT_TITLLE : Vérifier  la  modification de title
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
		        "Description": "Rectorat de Seine-Et-Marne"
			}}]}
"""
    Et le statut de la requete est OK

  Scénario: KO_UPDATE_UNIT__ID : Vérifier la non modification de _id
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_id" : "toto_id"
			}}]}
"""
    Et le statut de la requete est Bad Request

  Scénario: KO_UPDATE_UNIT__mgt :Vérifier la non modification de _mgt
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_mgt" : "{\"AccessRule\": [{ \"EndDate\":\"14/05/1987\"}] }"
			}}]}
"""
    Et le statut de la requete est Bad Request

  Scénario: KO_UPDATE_UNIT__OG :Vérifier la non modification de _og
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_og" : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__OPS :
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_ops" : [ ]
			}}]}
"""


  Scénario: KO_UPDATE_UNIT__unitType : Vérifier la non modification de _unitType
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_unitType" : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__tenant  : Vérifier la non modification de _tenant
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_tenant " : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__max  : Vérifier la non modification de _max
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_max " : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__min  : Vérifier la non modification de _min
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_min " : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__up : Vérifier la non modification de _up
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_up" : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__nbc  : Vérifier la non modification de _nbc
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_nbc " : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__us : Vérifier la non modification de _us
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_us" : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT__uds : Vérifier la non modification de _uds
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$set": {
				"_uds" : ""
			}}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__ID : Vérifier le non unset  de _id
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_id']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__OG :Vérifier le non unset de _og
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_og']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__OPS :
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['ops']}]}
"""


  Scénario: KO_UPDATE_UNIT_unset__unitType : Vérifier le non unset de _unitType
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_unitType']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__tenant  : Vérifier le non unset de _tenant
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_tenant']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__max  : Vérifier le non unset de _max
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_max']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__min  : Vérifier le non unset de _min
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_min']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__up : Vérifier le non unset de _up
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_up']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__nbc  : Vérifier le non unset de _nbc
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_nbc']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__us : Vérifier le non unset de _us
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_us']}]}
"""
    Et le statut de la requete est Bad Request


  Scénario: KO_UPDATE_UNIT_unset__uds : Vérifier le non unset de _uds
    Etant donné les tests effectués sur le tenant 0
    Quand je modifie l'unité archivistique avec la requete
"""
{"$action": [
		{"$unset": ['_uds']}]}
"""
    Et le statut de la requete est Bad Request
