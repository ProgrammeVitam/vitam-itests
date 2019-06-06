# language: fr

@Griffins_referential
Fonctionnalité: Import du referentiel scénario de preservation

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1
    Et je supprime les griffons et les scénarios de préservation sur tous les tenants
    Et j'importe le griffon nommé data/griffins/OK_griffons_referentiel.json
    Etant donné les tests effectués sur le tenant 0

  Scénario: import des scénario  a deux éléments
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/OK_scenario_liste.json
    Alors les metadonnées sont
      | Code | 201 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du référentiel des scénarios de préservation

  Scénario: import avec mise à jour intitulé
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/OK_scenario_maj_liste.json
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du référentiel des scénarios de préservation
    Quand je cherche le scénario de preservation nommé PSC-000001
    Alors les metadonnées sont
      | Name | Tranformation en PNG - BLABLA |

  Scénario: import avec mise à 1 seul scénario
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/OK_scenario_maj_1scenario.json
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du référentiel des scénarios de préservation
    Et le scénario de preservation nommé PSC-000005 n'existe pas
    Et le scénario de preservation nommé PSC-000003 n'existe pas

  Scénario: import avec mise à 4 scénarios
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/OK_scenario_maj_4scenarios.json
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import du référentiel des scénarios de préservation
    Quand je cherche le scénario de preservation nommé PSC-000005
    Alors les metadonnées sont
      | Name | Tranformation en PNG |

  Scénario: Injection html default griffin args
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_args.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin extension
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_extension.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin identifier
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_griffinIdentifier.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin maxsize
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_maxSize.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin timeout
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_timeout.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin type
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_defaultGriffin_type.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default description
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_description.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default formatlist
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_formatList.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format args
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_args.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format debug
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_debug.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format extension
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_extension.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format maxsize
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_maxSize.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format timeout
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_timeout.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html default griffin by format type
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_griffinByFormat_type.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html identifier
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_identifier.json
    Alors les metadonnées sont
    | Code | 412 |

  Scénario: Injection html name
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_html_injection_name.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: Invalid  Json
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_invalid_json.json
    Alors les metadonnées sont
      | Code | 412 |

  Scénario: Mauvais format
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_format.pdf
    Alors les metadonnées sont
      | Code | 400 |

  Scénario: Champ inconnu
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_unknown_json_field.json
    Et le statut final du journal des opérations est OK

  Scénario: Validation absent field griffin by format and no default griffin
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_absent_field_griffinByFormat_and_no_default.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'evDetData' de l'évenement final est : Invalid scenario for : 'PSC-000001' : at least one griffin must be defined (griffin by format or default griffin)

  Scénario: Validation false type creationdate
    Quand j'importe le preservation Scenario nommé data/preservationScenarios/KO_scenario_false_type_creationDate.json
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
