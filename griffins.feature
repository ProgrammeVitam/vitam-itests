# language: fr

@Griffins_referential
Fonctionnalité: Import du referentiel griffons

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1
    Et je supprime les griffons et les scénarios de préservation sur tous les tenants

  Scénario: import griffons a deux éléments
    Quand j'importe le griffon nommé data/griffins/OK_griffons_referentiel.json
    Alors les metadonnées sont
      | Code | 201 |
    Et le statut final du journal des opérations est OK

  Scénario: import avec mis à jour intitulé
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_intitule.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
      | Name        | ImageMagick BLABLA |

  Scénario: import avec mis à jour version
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_executableVersion.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
        | ExecutableVersion | V1.0.0 BLABLA |

  Scénario: import avec mis à jour executableName
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_executableName.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
        | ExecutableName | imagemagick-griffin BLABLA |

  Scénario: import avec mis à jour description
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_description.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
        | Description | BLABLA |

  Scénario: import 3e griffon avec mis à jour
    Quand j'importe le griffon nommé data/griffins/OK_griffons_maj_3griffons.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000003
    Et les metadonnées sont
        | Name | Griffon 3 : Griffon Jhove |


  Scénario: import 4 griffons avec 1 mis à jour
    Quand j'importe le griffon nommé data/griffins/OK_griffons.json
    Alors le statut final du journal des opérations est OK
    Quand je cherche le griffon nommé GRI-000001
    Et les metadonnées sont
        | Description | TEST my dear |
    Quand je cherche le griffon nommé GRIFFIN1
    Et les metadonnées sont
        | Description | GRIFFIN1 |
    Quand je cherche le griffon nommé GRIFFIN2
        Et les metadonnées sont
            | Description | GRIFFIN5 |
    Quand je cherche le griffon nommé GRIFFIN3
        Et les metadonnées sont
            | Name | dsf |

  Scénario: import griffons avec le meme identifiant
    Quand j'importe le griffon nommé data/griffins/KO_griffons_same_identifier.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons json invalide
    Quand j'importe le griffon nommé data/griffins/KO_griffons_invalid_json.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons injection html name
    Quand j'importe le griffon nommé data/griffins/KO_griffons_html_injection_name.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons injection html identifier
    Quand j'importe le griffon nommé data/griffins/KO_griffons_html_injection_identifier.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons injection html executableVersion
    Quand j'importe le griffon nommé data/griffins/KO_griffons_html_injection_ExecutableVersion.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons injection html executableName
    Quand j'importe le griffon nommé data/griffins/KO_griffons_html_injection_ExecutableName.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons injection html description
    Quand j'importe le griffon nommé data/griffins/KO_griffons_html_injection_description.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: import griffons creation date erronée
    Quand j'importe le griffon nommé data/griffins/KO_griffons_false_type_creationDate.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons valeur name absent
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_value_name.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons identifier valeur absente
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_value_identifier.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons champ Name absent
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_field_name.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons champ identifier absent
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_field_identifier.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons champ executable version absent
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_field_ExecutableVersion.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO

  Scénario: import griffons champ executable name absent
    Quand j'importe le griffon nommé data/griffins/KO_griffons_absent_field_ExecutableName.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO