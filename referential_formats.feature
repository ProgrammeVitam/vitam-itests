# language: fr

@Formats
@Referentials
Fonctionnalité: gestion des données référentielles (vérification, import et recherche)

  Contexte: Avant de lancer cette suite de test, je présuppose que le référentiel DROID_SignatureFile_V109 est chargé (_init.feature)

    Etant donné les tests effectués sur le tenant 1

  Scénario: Vérification et import des formats KO
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_KO.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 400                                     |

  @Light
  Scénario: Vérification et import des formats OK, recherche par id OK, rechercher par name OK
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V109.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
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
    Alors le nombre de résultat est 32
    Et les metadonnées sont
      | PUID           | "fmt/14"                                                     |
      | Name           | Acrobat PDF 1.0 - Portable Document Format |

  Scénario: Reimport format plus ancien V94
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V94.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V94.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |

  Scénario: Reimport format plus ancien V93
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V93.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V93.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_puid.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 0

    Quand j'utilise le fichier de requête suivant data/queries/select_format_all.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1584

  Scénario: Reimport format version V94
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V94.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V94.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_puid.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | PUID           | "fmt/1217"                               |
      | Name           | Leonardo Image Format                    |
      | VersionPronom  | 94                                       |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_all.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1670

  Scénario: Reimport format version V95
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V95.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V95.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_puid.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | PUID           | "fmt/1217"                               |
      | Name           | Leonardo Image Format                    |
      | VersionPronom  | 95                                       |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_all.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1686

  Scénario: Reimport format version V109
    Quand je vérifie le fichier nommé data/formats/DROID_SignatureFile_V109.xml pour le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 200                                     |
    Quand j'importe le fichier nommé data/formats/DROID_SignatureFile_V109.xml dans le référentiel FORMATS
    Alors les metadonnées sont
      | Code           | 201                                     |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_by_puid.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 1
    Et les metadonnées sont
      | PUID           | "fmt/1217"                               |
      | Name           | Leonardo Image Format                    |
      | VersionPronom  | 109                                      |

    Quand j'utilise le fichier de requête suivant data/queries/select_format_all.json
    Et je recherche les données dans le référentiel FORMATS
    Alors le nombre de résultat est 2246
