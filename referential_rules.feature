# language: fr

@ReferentialRules
Fonctionnalité: gestion des données référentielles (vérification, import et recherche)

  Contexte: Avant de lancer cette suite de test, je présuppose que les données de référentiel sont vides pour le tenant 1.
    Etant donné les tests effectués sur le tenant 1

  Scénario: Vérification et import des règles KO
    Quand je vérifie le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |
    Quand j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |

  Scénario: Vérification et import des règles contenant des contenus HTML toxiques
    Quand j'importe le fichier nommé data/rules/CSV_HTML.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |
      
  Scénario: Vérification et import des règles KO avec ligne vide
    Quand je vérifie le fichier nommé data/rules/jeu_donnees_KO_regles_CSV_empty_line.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |
    Quand j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV_empty_line.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |

  Scénario: Vérification et import des règles OK, recherche par id OK
    Quand je vérifie le fichier nommé data/rules/jeu_donnees_OK_regles_CSV_regles.csv pour le référentiel RULES                                |
    Quand j'utilise le fichier de requête suivant data/queries/select_rule_by_id.json 
    Et je recherche les données dans le référentiel RULES
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | RuleId           | APP-00001                             |
    Quand j'utilise la requête suivante
"""
{"$query":{"$and":[{"$eq":{"RuleValue":"Dossier individuel d’agent civil"}},{"$eq":{"RuleType":"AppraisalRule"}}]},"$filter":{},"$projection":{}}
"""
    Et je recherche les données dans le référentiel RULES
    Alors les metadonnées sont
      | RuleId           | APP-00001                             |
    Quand j'utilise le fichier de requête suivant data/queries/select_rule_by_type_order_by_id.json 
    Et je recherche les données dans le référentiel RULES
    Alors le nombre de résultat est 11
    Et les metadonnées sont
      | RuleId           | APP-1069004                            |
