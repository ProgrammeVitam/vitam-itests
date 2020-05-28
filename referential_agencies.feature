# language: fr

@Agencies
@Referentials
Fonctionnalité: gestion des données référentielles agencies (vérification, import et recherche)

  Contexte: Avant de lancer cette suite de test, je présuppose que les données du référentiel des services agents sont
  vides pour le tenant 1 (et pour tous les tenants dans le cas des formats).
  Les référentiels possibles sont FORMATS , RULES et AGENCIES
    Etant donné les tests effectués sur le tenant 1

## Agencies
  @Light
  Scénario: Vérification et import des services producteurs OK
    Quand je vérifie le fichier nommé data/agencies/agencies_init.csv pour le référentiel AGENCIES
    Alors les metadonnées sont
      | Code           | 200                                     |


  Scénario: Vérification et import d'un fichier de services agents au mauvais format
    Quand je vérifie le fichier nommé data/agencies/KO_agencies.pdf pour le référentiel AGENCIES
    Alors les metadonnées sont
      | Code           | 400                                     |
    Quand j'importe le fichier nommé data/rules/KO_agencies.pdf dans le référentiel AGENCIES
    Alors les metadonnées sont
      | Code           | 400  |


   Scénario: Vérification et import d'un fichier de services agents avec ligne vide
     Quand je vérifie le fichier nommé data/agencies/KO_agencies_empty_line.csv pour le référentiel AGENCIES
     Alors les metadonnées sont
       | Code           | 400                                     |
     Quand j'importe le fichier nommé data/agencies/KO_agencies_empty_line.csv dans le référentiel AGENCIES
     Alors les metadonnées sont
       | Code           | 400                                     |


   Scénario: Vérification et import d'un fichier de services agents contenant du HTML toxiques
     Quand j'importe le fichier nommé data/agencies/KO_agencies_HTML.csv dans le référentiel AGENCIES
      Alors les metadonnées sont
        | Code           | 400                                     |


   Scénario: Import d'un fichier de services agents avec colonne manquante
     Quand j'importe le fichier nommé data/agencies/KO_agencie_missing_field.csv dans le référentiel AGENCIES
      Alors les metadonnées sont
        | Code           | 400                                     |


  Scénario: Import d'un fichier de services agents avec colonne suplémentaire
     Quand j'importe le fichier nommé data/agencies/KO_agencies_additional_field.csv dans le référentiel AGENCIES
     Alors les metadonnées sont
     | Code           | 400                                     |


  Scénario: Import d'un fichier de services agents avec 2 identifiants identiques
     Quand j'importe le fichier nommé data/agencies/KO_agencies_same_identifer.csv dans le référentiel AGENCIES
     Alors les metadonnées sont
     | Code           | 400                                     |


  Scénario: Import d'un fichier de services agent avec le champ obligatoire Name manquant
     Quand j'importe le fichier nommé data/agencies/KO_agencies_missing_name_field.csv dans le référentiel AGENCIES
     Alors les metadonnées sont
     | Code           | 400                                     |


  Scénario: Import d'un fichier de services agent avec le champ obligatoire Identifier manquant
     Quand j'importe le fichier nommé data/agencies/KO_agencies_missing_identifier_field.csv dans le référentiel AGENCIES
     Alors les metadonnées sont
     | Code           | 400                                     |

