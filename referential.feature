# language: fr

@Referential
Fonctionnalité: gestion des données référentielles (vérification, import et recherche)

  Contexte: Avant de lancer cette suite de test, je présuppose que les données de référentiel sont vides pour le tenant 1 (et pour tous les tenants dans le cas des formats). Les référentiels possibles sont FORMATS et RULES

  Scénario: Vérification et import des formats KO
    Etant donné les tests effectués sur le tenant 1
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_KO.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 400                 |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_KO.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 400                 |

  Scénario: Vérification et import des formats OK, recherche par id OK
    Etant donné les tests effectués sur le tenant 1
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V88.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                 |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V88.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                 |
    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_id.json 
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Status           | 204                 |

  Scénario: Vérification et import des règles KO
    Etant donné les tests effectués sur le tenant 1
    Quand je vérifie le fichier nommé data/rules/regles_CSV_KO.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                 |
    Quand j'importe le fichier nommé data/rules/regles_CSV_KO.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 400                 |

  Scénario: Vérification et import des règles OK, recherche par id OK
    Etant donné les tests effectués sur le tenant 1
    Quand je vérifie le fichier nommé data/rules/regles_CSV.csv pour le référentiel RULES
    Alors les metadonnées sont
      | Code           | 200                 |
    Quand j'importe le fichier nommé data/rules/regles_CSV.csv dans le référentiel RULES
    Alors les metadonnées sont
      | Code           | 201                 |
    Quand j'utilise le fichier de requête suivant data/queries/select_rule_by_id.json 
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | Status           | 204                 |
