# language: fr

@AccessAccessionRegister
Fonctionnalité: Recherche dans les registres de fond

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Upload d'un SIP et vérification du contenu dans le registre de fonds
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO-COMPLEXE.zip
    Quand je télécharge le SIP
		Et j'utilise le fichier de requête suivant data/queries/select_accession_register_by_id.json
    Et je recherche les détails des registres de fond pour le service producteur Vitam
    Alors les metadonnées pour le détail du registre de fond sont
      | OriginatingAgency        | Vitam              |
      | SubmissionAgency         | Vitam              |
      | ArchivalAgreement        | ArchivalAgreement0 |
      
      
#  Scénario: ACCESSION REGISTER EXEMPLE
#    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
#    Quand je télécharge le SIP
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est OK
#    Quand j'utilise la requête suivante
#"""
#{
#  "$query": {
#    "$eq": {
#      "OriginatingAgency": "FRAN_NP_009913"
#    }
#  },
#  "$projection": {}
#}
#"""
#    Et je recherche les registres de fond
#    Et le nombre de registres de fond est 1
#    Et les metadonnées pour le registre de fond sont
#      | OriginatingAgency        | FRAN_NP_009913              |
#      | TotalObjects.ingested        | 4 |
#      | TotalObjectGroups.ingested        | 4 |
#      | TotalUnits.ingested        | 7 |
#      Quand j'utilise la requête suivante
#"""
#{
#	"$query": {
#		"$and": [
#			{
#				"$in": {
#					"OperationIds": [
#						"Operation-Id"
#					]
#				}
#			}
#		]
#	},
#	"$projection": {}
#}
#"""
#    Et je recherche les détails des registres de fond pour le service producteur FRAN_NP_009913
#    Et le nombre de détails du registre de fond est 1
#    Et les metadonnées pour le détail du registre de fond sont
#      | OriginatingAgency        | FRAN_NP_009913              |
#      | TotalObjects.ingested        | 4 |
#      | TotalObjectGroups.ingested        | 4 |
#      | TotalUnits.ingested        | 7 |
