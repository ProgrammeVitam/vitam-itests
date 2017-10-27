# language: fr

@DslOperatorMatch
Fonctionnalité: DSL test opérateur eq

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Dsl operator $eq sur les contrats d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK

    # Type strict_date_optional_time
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur ActivationDate
    Et j'utilise dans la requête le paramètre VALUE avec la valeur 2016-12-10T00:00:00.000
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre ActivationDate avec la valeur 1950-12-10T00:00:00.000
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

    # Type string not analyzed en tableau
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUE avec la valeur BinaryMaster
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUE avec la valeur BINARYMASTER
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUE avec la valeur Not_exist
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

    # Type string boolean
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur EveryDataObjectVersion
    Et j'utilise dans la requête le paramètre VALUE avec la valeur false
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur EveryDataObjectVersion
    Et j'utilise dans la requête le paramètre VALUE avec la valeur true
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

    # Type string not analyzed
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Status
    Et j'utilise dans la requête le paramètre VALUE avec la valeur ACTIVE
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Status
    Et j'utilise dans la requête le paramètre VALUE avec la valeur INACTIVE
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

    # Type long
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #tenant
    Et j'utilise dans la requête le paramètre VALUE avec la valeur 0
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_eq.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #tenant
    Et j'utilise dans la requête le paramètre VALUE avec la valeur 900
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0

    Scénario: Dsl operator $eq sur les unités archivistiques
      Etant donné les tests effectués sur le tenant 0
      Et un fichier SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip
      Quand je télécharge le SIP
      Alors le statut final du journal des opérations est OK

      # Type strict_date_optional_time
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur StartDate
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2016-10-19T17:45:18
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur StartDate
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1950-10-19T17:45:18
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type string not analyzed en tableau
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #originating_agencies
      Et j'utilise dans la requête le paramètre VALUE avec la valeur FRAN_NP_050770
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 18
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #originating_agencies
      Et j'utilise dans la requête le paramètre VALUE avec la valeur Not_an_originatingAgency
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type boolean
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #management.AppraisalRule.Inheritance.PreventInheritance
      Et j'utilise dans la requête le paramètre VALUE avec la valeur false
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #management.AppraisalRule.Inheritance.PreventInheritance
      Et j'utilise dans la requête le paramètre VALUE avec la valeur true
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type string not analyzed
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
      Et j'utilise dans la requête le paramètre VALUE avec la valeur RecordGrp
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 8
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
      Et j'utilise dans la requête le paramètre VALUE avec la valeur Not_a_desc
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type long
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #max
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 3
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 10
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #max
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 60
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type string avec vérification que $eq != $match*. La chaine du SIP qui existe est "foxtrot golf hotel"
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur OriginatingAgency.Identifier
      Et j'utilise dans la requête le paramètre VALUE avec la valeur foxtrot
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur OriginatingAgency.Identifier
      Et j'utilise dans la requête le paramètre VALUE avec la valeur foxtrot golf hotel
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur OriginatingAgency.Identifier
      Et j'utilise dans la requête le paramètre VALUE avec la valeur foxtrot golf hotels
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur OriginatingAgency.Identifier
      Et j'utilise dans la requête le paramètre VALUE avec la valeur foxtrot GOLF hotel
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur OriginatingAgency.Identifier
      Et j'utilise dans la requête le paramètre VALUE avec la valeur golf foxtrot hotel
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type integer dans les MD libres avec et sans tableaux
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataNumber3.DataDate33.DataNumber331
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2016
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataNumber3.DataDate33.DataNumber331
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2017
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataNumber3.DataDate33.DataNumber332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2017
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataNumber3.DataDate33.DataNumber332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2018
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataNumber3.DataDate33.DataNumber332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1950
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type integer dans les MD libres avec et sans tableaux
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal31
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1244,567890
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal31
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1234
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1234.567890
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1235.567890
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 999
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type boolean dans les MD libres avec et sans tableaux
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataBoolean3.DataBoolean31
      Et j'utilise dans la requête le paramètre VALUE avec la valeur true
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataBoolean3.DataBoolean31
      Et j'utilise dans la requête le paramètre VALUE avec la valeur false
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1234.567890
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1235.567890
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDecimal3.DataDecimal32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 999
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataBoolean3.DataBoolean33.DataBoolean332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur true
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataBoolean3.DataBoolean33.DataBoolean332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur false
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataBoolean3.DataBoolean32
      Et j'utilise dans la requête le paramètre VALUE avec la valeur false
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0

      # Type date dans les MD libres avec et sans tableaux
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDate3.DataDate33.DataDate331
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2016-05-31T19:17:53
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDate3.DataDate33.DataDate331
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1950-05-31T19:17:53
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDate3.DataDate33.DataDate332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 2017-05-31T19:17:53
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 1
      Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_eq.json
      Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataDate3.DataDate33.DataDate332
      Et j'utilise dans la requête le paramètre VALUE avec la valeur 1950-05-31T19:17:53
      Et je recherche les unités archivistiques
      Alors le nombre de résultat est 0
