# language: fr

@Referential
Fonctionnalité: gestion des données référentielles (vérification, import et recherche)

  Contexte: Avant de lancer cette suite de test, je présuppose que les données de référentiel sont vides pour le tenant 1 (et pour tous les tenants dans le cas des formats). Les référentiels possibles sont FORMATS et RULES
    Etant donné les tests effectués sur le tenant 1

  Scénario: Vérification et import des formats KO
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_KO.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 400                                     |
#    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_KO.xml dans le référentiel FORMATS
#    Alors les metadonnées sont
#      | Code           | 400                                     |

  Scénario: Vérification et import des formats OK, recherche par id OK, rechercher par name OK
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V88.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
#    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V88.xml dans le référentiel FORMATS
#    Alors les metadonnées sont
#      | Code           | 201                                     |
    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_id.json 
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | PUID           | "x-fmt/1"                               |
      | Name           | Microsoft Word for Macintosh Document   |
    Quand j'utilise le fichier de requête suivant data/queries/select_format_png.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 4
    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_puid_order_asc.json 
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 31
    Et les metadonnées sont
      | PUID           | "fmt/14"                                                     |
      | Name           | Acrobat PDF 1.0 - Portable Document Format |
      
  Scénario: Vérification et import des règles KO
    Quand je vérifie le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                                     |
    Quand j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 409                                     |

  Scénario: Vérification et import des règles contenant des contenus HTML toxiques
    Quand j'importe le fichier nommé data/rules/CSV_HTML.csv dans le référentiel RULES
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
    Alors le nombre de résultat est 6
    Et les metadonnées sont
      | RuleId           | APP-1069004                            |

  Scénario: Vérification et import des services producteurs OK
    Quand je vérifie le fichier nommé data/agencies/agencies_init.csv pour le référentiel AGENCIES
    Alors les metadonnées sont
      | Code           | 200                                     |
