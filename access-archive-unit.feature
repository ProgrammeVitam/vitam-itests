# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/contracts/contract_acces_TNR.json
    Et les tests effectués sur le tenant 1
    Alors j'importe ce contrat sans échec de type ACCESS_CONTRACTS



  Scénario: SRC1 - Recherche une archive unit avec un intervalle de temps sur plusieurs tenants
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_SRC1_DATES_EXTREMES_OBJETS.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand  j'utilise le fichier de requête suivant data/queries/select_dates_extremes_src1.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | Liste des armements |
      | DescriptionLevel | Item                |
      | StartDate        | 1700-01-01          |
      | EndDate          | 1700-01-02          |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: SRC2 - chercher les unités ayant un titre donné et une description contenant au moins un mots clés donnés
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_SRC2_TITLE_DESC_UNITS_SANS_OBJ.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_titre_description_src2.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title | Rectorat de Seine-Et-Marne  |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Access SORT - Recherche de plusieurs archive unit ordonées dans l'ordre inverse des titres
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE_SORT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_order_description_desc.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Alors les metadonnées sont
      | Title            | ID8                                             |
      | Description      | Description de l'archive unit d'identifiant ID8 |

  Scénario: Recherche une archive unit qui contient le letter tokenizer
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/US_2101/OK_SIP_2101.zip
    Quand je télécharge le SIP
    Et j'utilise la requête suivante
"""
{
	"$roots": [],
	"$query": [
		{
			"$and": [
				{
					"$in": {
						"#operations": [
							"Operation-Id"
						]
					}
				},
				{
					"$match": {
						"Description": "17"
					}
				}
			],
			"$depth": 20
		}
	],
	"$filter": {
		"$orderby": {
			"TransactedDate": 1
		}
	},
	"$projection": {
		"$fields": {
			"TransactedDate": 1,
			"#id": 1,
			"Title": 1
		}
	}
}
"""
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
	      | Title            | BAD0431E2C5E80E5BD42D547A3ED59665555.odt |


  Scénario: US 2216 / CAS OK = import SIP OK et métadonnées de l'objet physique OK
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Quand j'utilise la requête suivante
"""
{ "$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"Sed blandit mi dolor"}},{"$in":{"#operations":["Operation-Id"]}}],
      "$depth": 0}],
    "$projection": {
    "$fields": {
      "TransactedDate": 1, "#id": 1, "Title": 1, "#object": 1, "DescriptionLevel": 1, "EndDate": 1, "StartDate": 1
}}}
"""
    Et je recherche les groupes d'objets des unités archivistiques
    Alors les metadonnées sont
	      | #qualifiers.PhysicalMaster.versions.0.DataObjectVersion                      | PhysicalMaster_1    |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Height.value        | 21                  |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Height.unit         | centimetre          |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Length.value        | 29.7                |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Length.unit         | centimetre          |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Weight.value        | 1                   |
	      | #qualifiers.PhysicalMaster.versions.0.PhysicalDimensions.Weight.unit         | kilogram            |
	      | #qualifiers.BinaryMaster.versions.0.DataObjectVersion                        | BinaryMaster_1      |
	      | #qualifiers.BinaryMaster.versions.0.FileInfo.Filename                        | Filename0           |
	      | #qualifiers.BinaryMaster.versions.0.FormatIdentification.FormatId            | fmt/18              |
	      
