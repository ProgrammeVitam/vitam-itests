#language: fr

@DslOperatorIn
Fonctionnalité: Test operateur IN du DSL

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Dsl operator $in sur les contrats d'accès

    # Type strict_date_optional_time
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur ActivationDate
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "2016-12-10T00:00:00.000"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur ActivationDate
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "1950-12-10T00:00:00.000"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur ActivationDate
        Et j'utilise dans la requête le paramètre VALUES avec la valeur "2016-12-10T00:00:00.000", "1950-12-10T00:00:00.000"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1

    # Type string not analyzed en tableau
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "BinaryMaster"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "BINARYMASTER"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "Not_exist"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DataObjectVersion
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "BinaryMaster", "BINARYMASTER", "Not_exist"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1

    # Type string not analyzed
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Status
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "ACTIVE"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Status
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "INACTIVE"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur Status
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "ACTIVE", "INACTIVE"
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1

    # Type long
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #tenant
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 0
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #tenant
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 900
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_accesscontracts_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #tenant
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 0, 900
    Et je recherche les données dans le référentiel ACCESS_CONTRACTS
    Alors le nombre de résultat est 1

  Scénario: Dsl operator $in sur les unités archivistiques
    Etant donné les tests effectués sur le tenant 0
    Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_ARBO_rateau_MD_complexes_match.zip

    # Type strict_date_optional_time
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur StartDate
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "2016-10-19T17:45:18"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur StartDate
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "1950-10-19T17:45:18"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur StartDate
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "2016-10-19T17:45:18", "1950-10-19T17:45:18"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 1

    # Type string not analyzed en tableau
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #originating_agencies
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "FRAN_NP_050770"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 18
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #originating_agencies
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "Not_an_originatingAgency"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #originating_agencies
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "FRAN_NP_050770", "Not_an_originatingAgency"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 18

    # Type string not analyzed
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "RecordGrp"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 8
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "RECORDGRP"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "Not_a_desc"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur DescriptionLevel
    Et j'utilise dans la requête le paramètre VALUES avec la valeur "RecordGrp", "RECORDGRP", "Not_a_desc"
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 8

    # Type long
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #max
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 3
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #max
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 60
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 0
    Quand j'utilise le fichier de requête suivant data/queries/select_units_dsl_in.json
    Et j'utilise dans la requête le paramètre PARAMETER avec la valeur #max
    Et j'utilise dans la requête le paramètre VALUES avec la valeur 3, 60
    Et je recherche les unités archivistiques
    Alors le nombre de résultat est 10
