# language: fr

@Rules
@Referentials
Fonctionnalité: gestion des données référentielles (vérification, import et recherche)

    Contexte: Avant de lancer cette suite de test, je présuppose que les données de référentiel sont vides pour le tenant 1.
        Etant donné les tests effectués sur le tenant 1


    Scénario: Import des règles avec une RuleMeasurement de 9999
        Quand je vérifie le fichier nommé data/rules/rules_ko_ACC-00004_9999.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ACC-00004_9999.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import des règles contenant des contenus HTML toxiques - KO
        Quand j'importe le fichier nommé data/rules/rules_ko_html_toxique.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |


    Scénario: Import d'un fichier qui n'est pas au format csv
        Quand je vérifie le fichier nommé data/rules/rules_ko_mauvais_format.pdf dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |


    Scénario: Import des règles avec ligne vide - KO
        Quand je vérifie le fichier nommé data/rules/rules_ko_empty_line.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_empty_line.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec colonne supplémentaire
        Quand je vérifie le fichier nommé data/rules/rules_ko_colonne_supplementaire.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_colonne_supplementaire.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV_ENCODING_NOT_UTF_EIGHT.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec colonne manquante
        Quand je vérifie le fichier nommé data/rules/rules_ko_colonne_absente.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_colonne_absente.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec une règle sans identifiant
        Quand je vérifie le fichier nommé data/rules/rules_ko_sans_id.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_sans_id.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un identifiant en double
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleId_non_unique.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleId_non_unique.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un mauvais séparateur
        Quand je vérifie le fichier nommé data/rules/rules_ko_mauvais_separateur.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_mauvais_separateur.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier dont l'association de RuleDuration et RuleMeasurement est supérieur à 999 ans
        Quand je vérifie le fichier nommé data/rules/rules_ko_duration_excessive.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_duration_excessive.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un champ RuleType déclarant une valeur non autorisée
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleType_non_autorise.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleType_non_autorise.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    Scénario: Import d'un fichier avec un champ RuleType déclarant une valeur invalide
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleType_invalide.csv pour le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleType_invalide.csv dans le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un champ RuleMeasurement déclarant une valeur non autorisée
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleMeasurement_incorrect.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleMeasurement_incorrect.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un champ RuleDuration déclarant une valeur négative
        Quand je vérifie le fichier nommé data/rules/rules_ko_duration_negative.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_duration_negative.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un champ RuleDuration vide
        Quand je vérifie le fichier nommé data/rules/KO_regles_duration_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_duration_excessive.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    Scénario: Import d'un fichier avec règle de gel avec un champ RuleDuration vide et RuleMeasurement non vide
        Quand je vérifie le fichier nommé data/rules/rules_ko_holdrule_ruleMeasurement_non_vide_ruleDuration_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_holdrule_ruleMeasurement_non_vide_ruleDuration_vide.csv dans le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    Scénario: Import d'un fichier avec un champ RuleValue vide
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleValue_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleValue_vide.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion


    Scénario: Import d'un fichier avec un champ RuleMeasurement vide
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleMeasurement_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleMeasurement_vide.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    Scénario: Import d'un fichier avec règle de gel avec un champ RuleMeasurement vide et RuleDuration non vide
        Quand je vérifie le fichier nommé data/rules/rules_ko_holdrule_ruleMeasurement_vide_ruleDuration_non_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_holdrule_ruleMeasurement_vide_ruleDuration_non_vide.csv dans le référentiel RULES
        Alors les metadonnées sont
            | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    Scénario: Import d'un fichier avec un champ RuleType vide
        Quand je vérifie le fichier nommé data/rules/rules_ko_ruleType_vide.csv pour le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand j'importe le fichier nommé data/rules/rules_ko_ruleType_vide.csv dans le référentiel RULES
        Alors les metadonnées sont
        | Code | 400 |
        Quand  je recherche le journal des opérations
        Alors le statut final du journal des opérations est KO
        Et l'outcome détail de l'événement CHECK_RULES est CHECK_RULES.INVALID_CSV.KO
        Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des règles de gestion

    @Light
    Scénario: Vérification et import des règles OK, recherche par id OK
        Quand j'importe le fichier nommé data/rules/rules_ok.csv pour le référentiel RULES
        Quand j'utilise le fichier de requête suivant data/queries/select_rule_by_id.json
        Et je recherche les données dans le référentiel RULES
        Alors le nombre de résultat est 1
        Et les metadonnées sont
        | RuleId | APP-00001 |
        Quand j'utilise la requête suivante
        """
        {"$query":{"$and":[{"$eq":{"RuleValue":"Dossier individuel d’agent civil"}},{"$eq":{"RuleType":"AppraisalRule"}}]},"$filter":{},"$projection":{}}
        """
        Et je recherche les données dans le référentiel RULES
        Alors les metadonnées sont
        | RuleId | APP-00001 |
        Quand j'utilise le fichier de requête suivant data/queries/select_rule_by_type_order_by_id.json
        Et je recherche les données dans le référentiel RULES
        Alors le nombre de résultat est 11
        Et les metadonnées sont
        | RuleId | APP-1069004 |
