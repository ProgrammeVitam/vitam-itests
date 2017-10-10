# language: fr

@DslOperatorRange
Fonctionnalité: DSL test opérateur range

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type ENTRY_CONTRACTS

  Scénario: Dsl operator $range test sur date au format YYYY-MM-DD : gte/lte, gt/lt, gte/lt, gt/lte sur valeur exacte du champ
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_yyyy-mm-dd_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_yyyy-mm-dd_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
	  Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_yyyy-mm-dd_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
	  Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_yyyy-mm-dd_lte_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Dsl operator $range test sur date au format YYYY-MM-DDTHH:mm:ss : gte/lte, gt/lt, gte/lt, gt/lte sur valeur exacte du champ
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
		Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
		Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
		Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
		Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Dsl operator $range test sur date : date max < date min, données tableau, données sous-objet, données tableau de tableau
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
		Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_inf_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_gte_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_gte_sub_object.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_date_full_lte_gte_array_of_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    
  Scénario: Dsl operator $range test sur number entier : gte/lte, gt/lt, gte/lt, gt/lte sur entier, max < min, tableau, sous-objet, tableau de tableau, entier négatif
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_inf_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gte_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gte_sub_object.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gte_array_of_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_number_lte_gte_neg.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Dsl operator $range test sur number decimal : gte/lte, gt/lt, gte/lt, gt/lte sur decimal, max < min, tableau, sous-objet, tableau de tableau, decimal négatif
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gt.json
   Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_inf_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gte_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gte_sub_object.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gte_array_of_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_decimal_lte_gte_neg.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0

  Scénario: Dsl operator $range test sur boolean : gte/lte, gt/lt, gte/lt, gt/lte sur boolean, tableau, sous-objet, tableau de tableau
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lte_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lte_gte_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lte_gte_sub_object.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_boolean_lte_gte_array_of_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

  Scénario: Dsl operator $range test sur string : gte/lte, gt/lt, gte/lt, gt/lte sur string, tableau, sous-objet, tableau de tableau
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lt_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lte_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lte_gte_array.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_mdc_range_string_lte_gte_sub_object.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    
  Scénario: Dsl operator $range test sur données SEDA
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes.zip
    Quand je télécharge le SIP
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_transacteddate_range_lt_gt.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_title_range_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_tenant_range_lte_gte.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 17
    Quand j'utilise le fichier de requête suivant data/queries/dsl-operator-range/select_tenant_range_lte_gte_empty.json
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    