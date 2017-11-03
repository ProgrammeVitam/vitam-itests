# language: fr

@AccessArchiveUnit
Fonctionnalité: Recherche une archive unit existante

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/Linagora_IT19_contrat/upload_tenant_0/contrat_modification_autorisees.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/Linagora_IT19_contrat/upload_tenant_0/contrat_modification_interdites.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/contracts/contract_acces_TNR.json
    Et les tests effectués sur le tenant 1
    Alors j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/Linagora_IT19_contrat/upload_tenant_0/contrat_inactif_tous_producteurs.json
    Et les tests effectués sur le tenant 1
    Alors j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/Linagora_IT19_contrat/upload_tenant_0/contrat_tous_producteur.json
    Et les tests effectués sur le tenant 1
    Alors j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: Import de contrat de type contract accès
    Etant donné un contract nommé data/Linagora_IT19_contrat/upload_tenant_0/contrat_producteur1.json
    Et les tests effectués sur le tenant 1
    Alors j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  Scénario: US2230 --  chercher une unité archivistique nommée “Galliéni”, en utilisant un identifiant de contrat inconnu sur ce tenant mais connu sur un autre tenant “contrat_tous_producteurs”
    Etant donné les tests effectués sur le tenant 2
    Et les tests effectués sur le contrat id contrat_tous_producteur
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_Gallieni.json
    Alors le statut de select résultat est Unauthorized

  Scénario: US2230 -- chercher cette même unité, mais en utilisant un contrat inactif “contrat_inactif_tous_producteurs”
    Etant donné les tests effectués sur le tenant 1
    Et les tests effectués sur le contrat id contrat_inactif_tous_producteurs
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_Gallieni.json
    Alors le statut de select résultat est Unauthorized

  Scénario: US2232 -- éditer des métadonnées avec succès
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id contrat_modification_autorisees
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_00
    Alors les metadonnées sont
      | Title            | Porte de Bagnolet par producteur1 |
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1

  Scénario: US2232 -- éditer des métadonnées sans succès
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id contrat_modification_interdites
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_having_title_description.json
    Et je recherche les unités archivistiques pour trouver l'unite OriginatingSystemId_00
    Alors les metadonnées sont
      | Title            | Porte de Bagnolet par producteur1 |
    Quand j'utilise le fichier de requête suivant data/queries/update_unit_title_description.json
    Alors le statut de update résultat est Unauthorized

  Scénario: US2231 -- Sélectionner le contrat “contrat_producteur1”
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id ContratTNR
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_id.json
    Et je recherche les détails des registres de fond pour le service producteur producteur1
    Alors les metadonnées sont
      | OriginatingAgency        | producteur1              |
    Quand j'utilise le fichier de requête suivant data/queries/select_Gallieni.json
    Alors le nombre de résultat est 1

  Scénario: SRC1 - Recherche une archive unit avec un intervalle de temps sur plusieurs tenants
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id ContratTNR
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
      | Title | SRC2_TITLE_DESC_UNITS_Rectorat de Nantes  |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0


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



  # A Valider avec Gaelle
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
      | #qualifiers.0.versions.0.DataObjectVersion                      | PhysicalMaster_1    |
      | #qualifiers.0.versions.0.PhysicalDimensions.Height.value        | 21                  |
      | #qualifiers.0.versions.0.PhysicalDimensions.Height.unit         | centimetre          |
      | #qualifiers.0.versions.0.PhysicalDimensions.Length.value        | 29.7                |
      | #qualifiers.0.versions.0.PhysicalDimensions.Length.unit         | centimetre          |
      | #qualifiers.0.versions.0.PhysicalDimensions.Weight.value        | 1                   |
      | #qualifiers.0.versions.0.PhysicalDimensions.Weight.unit         | kilogram            |
      | #qualifiers.1.versions.0.DataObjectVersion                        | BinaryMaster_1      |
      | #qualifiers.1.versions.0.FileInfo.Filename                        | Filename0           |
      | #qualifiers.1.versions.0.FormatIdentification.FormatId            | fmt/18              |


  Scénario: Access SORT - Recherche de plusieurs archive unit ordonées dans l'ordre inverse des OrignatingSystemId
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE_SORT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_order_description_desc.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 5
    Alors les metadonnées sont
      | Title                 | ID8                                             |
      | Description           | Description de l'archive unit d'identifiant ID8 |
      | DescriptionLevel      | Item                                            |
      | #unitups.path.array[] | ["{{unit:ID4}}","{{unit:ID10}}"]                |
    Quand je recherche les groupes d'objets de l'unité archivistique dont le titre est ID8
    Alors les metadonnées sont
      | FileInfo.Filename                  | jeux_test.ods   |
      | #qualifiers.BinaryMaster._nbc      | 1               |

  Scénario: Access EveryOriginatingAgency OK - Recherche d'une archive avec un contrat acceptant tous les services producteurs
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

  Scénario: Access EveryOriginatingAgency KO - Recherche d'une archive avec un contrat n'acceptant pas tous les services producteurs
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id contrat_EveryOriginatingAgency_false
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Recherche avancée d’archives – cas OK d’une recherche monocritère en utilisant comme critère de recherche une métadonnée de gestion (API)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO_test.zip
    Et je télécharge le SIP
    Quand  j'utilise le fichier de requête suivant data/queries/select_monocritere.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | untitredesipunique  |
      | DescriptionLevel | RecordGrp           |
      | StartDate        | 2016-06-03T15:28:00 |
      | EndDate          | 2016-06-03T15:28:00 |

  Scénario: Recherche avancée d’archives – cas OK d’une recherche multicritères de métadonnées de gestion (API)
    Etant donné les tests effectués sur le tenant 0
    Quand  j'utilise le fichier de requête suivant data/queries/select_multicriteres.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | untitredesipunique  |
      | DescriptionLevel | RecordGrp           |
      | StartDate        | 2016-06-03T15:28:00 |
      | EndDate          | 2016-06-03T15:28:00 |


  Scénario: Recherche avancée d’archives – cas OK d’une recherche multicritères croisant métadonnées métadonnées descriptives et métadonnées de gestion (API)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK-RULES_TEST.zip
    Et je télécharge le SIP
    Quand  j'utilise le fichier de requête suivant data/queries/select_multicriteres_md.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | titre20999999  |
      | StartDate        | 2012-06-20T18:58:18 |
      | EndDate          | 2014-12-07T09:52:56 |

  Scénario: Recherche avancée d’archives – recherche d’archives dans un tenant sur la base de critères correspondant à des archives conservées dans un autre tenant (manuel)
    Etant donné les tests effectués sur le tenant 0
    Quand  j'utilise le fichier de requête suivant data/queries/select_multicriteres_md.json
    Et je recherche les unités archivistiques
    Alors les metadonnées sont
      | Title            | titre20999999  |
      | StartDate        | 2012-06-20T18:58:18 |
      | EndDate          | 2014-12-07T09:52:56 |
    Mais les tests effectués sur le tenant 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Recherche avancée d’archives – recherche KO par date, le format de date étant invalide (API)
    Etant donné les tests effectués sur le tenant 0
    Quand  j'utilise le fichier de requête suivant data/queries/select_dates_extremes_src_mauvais_format.json
    Alors le statut de select résultat est Method Not Allowed

  Scénario: US2455 -- Spécifier un usage par défaut aux contrats d'accès
    Etant donné les tests effectués sur le tenant 0
    Et les tests effectués sur le contrat id contract_with_field_EveryDataObjectVersion
    Et un fichier SIP nommé data/Linagora_IT19_contrat/upload_tenant_0/Gallieni_metro_producteur1.zip
    Quand je télécharge le SIP
    Et je télécharge le fichier binaire de l'unité archivistique nommé "Gambetta par producteur1" à l'usage "BinaryMaster" version 0
    Alors le status de la réponse est UNAUTHORIZED
    Quand je modifie le contrat d'accès contract_with_field_EveryDataObjectVersion avec le fichier de requête suivant data/queries/update_contract.json
    Et je télécharge le fichier binaire de l'unité archivistique nommé "Gambetta par producteur1" à l'usage "BinaryMaster" version 0
    Alors le status de la réponse est OK

  Scénario: Recherche avancée d’archives – recherche OK sur des titres dans des alphabets différents (API)
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_recherches_differentes_langues.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_unit_by_title_hebrew.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand  j'utilise le fichier de requête suivant data/queries/select_unit_by_title_arabic.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand  j'utilise le fichier de requête suivant data/queries/select_unit_by_title_russian.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand  j'utilise le fichier de requête suivant data/queries/select_unit_by_title_japanese.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand  j'utilise le fichier de requête suivant data/queries/select_unit_by_title_turkish.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
