#language: fr

@DslFacet
Fonctionnalité: Test facet

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés
  et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS


  Scénario: Test 1 facet terms : DescriptionLevel 5 facetsResults
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/FRAD084_ReboisementVentoux.zip
    Quand j'utilise le fichier de requête suivant data/queries/dsl-facet/select_one_facet_terms.json
		Et j'utilise dans la requête le paramètre NAME_FACET avec la valeur facet_desclevel
		Et j'utilise dans la requête le paramètre FIELD_FACET avec la valeur DescriptionLevel
		Et j'utilise dans la requête le paramètre SIZE_FACET avec la valeur 5
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et le résultat pour la facet facet_desclevel contient 31 valeurs RecordGrp
    Et le résultat pour la facet facet_desclevel contient 1 valeurs Fonds

  Scénario: Test 1 facet terms : DescriptionLevel 1 facetsResults
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/FRAD084_ReboisementVentoux.zip
    Quand j'utilise le fichier de requête suivant data/queries/dsl-facet/select_one_facet_terms.json
		Et j'utilise dans la requête le paramètre NAME_FACET avec la valeur facet_desclevel
		Et j'utilise dans la requête le paramètre FIELD_FACET avec la valeur DescriptionLevel
		Et j'utilise dans la requête le paramètre SIZE_FACET avec la valeur 1
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et le résultat pour la facet facet_desclevel contient 31 valeurs RecordGrp
    Et le résultat pour la facet facet_desclevel ne contient pas la valeur Fonds

  Scénario: Test 1 facet terms : AccessRule 3 facetsResults
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_COMPLEXE_COMPLETE.zip
    Quand j'utilise le fichier de requête suivant data/queries/dsl-facet/select_one_facet_terms.json
		Et j'utilise dans la requête le paramètre NAME_FACET avec la valeur facet_storagerule
		Et j'utilise dans la requête le paramètre FIELD_FACET avec la valeur #management.AccessRule.Rules.Rule
		Et j'utilise dans la requête le paramètre SIZE_FACET avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et le résultat pour la facet facet_storagerule contient 7 valeurs ACC-00002
    Et le résultat pour la facet facet_storagerule contient 6 valeurs ACC-00003
    Et le résultat pour la facet facet_storagerule contient 2 valeurs ACC-00001
    Et le résultat pour la facet facet_storagerule ne contient pas la valeur ACC-00004

  Scénario: Test 2 facets terms : Tag 3 facetsResults, KeywordContent 3 facetResults (should be same results) 
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/FRAD084_ReboisementVentoux.zip
    Quand j'utilise le fichier de requête suivant data/queries/dsl-facet/select_two_facets_terms.json
		Et j'utilise dans la requête le paramètre NAME_FACET_1 avec la valeur facet_tag
		Et j'utilise dans la requête le paramètre FIELD_FACET_1 avec la valeur Tag
		Et j'utilise dans la requête le paramètre SIZE_FACET_1 avec la valeur 3
		Et j'utilise dans la requête le paramètre NAME_FACET_2 avec la valeur facet_keyword_content
		Et j'utilise dans la requête le paramètre FIELD_FACET_2 avec la valeur Keyword.KeywordContent
		Et j'utilise dans la requête le paramètre SIZE_FACET_2 avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Et le résultat pour la facet facet_tag contient 15 valeurs Brantes (Vaucluse, France)
    Et le résultat pour la facet facet_tag contient 7 valeurs Saint-Léger-du-Ventoux (Vaucluse, France)
    Et le résultat pour la facet facet_tag contient 4 valeurs plantation
    Et le résultat pour la facet facet_keyword_content contient 15 valeurs Brantes (Vaucluse, France)
    Et le résultat pour la facet facet_keyword_content contient 7 valeurs Saint-Léger-du-Ventoux (Vaucluse, France)
    Et le résultat pour la facet facet_keyword_content contient 4 valeurs plantation
    
