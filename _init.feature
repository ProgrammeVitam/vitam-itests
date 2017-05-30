# language: fr

@_init
Fonctionnalité: initialisation

  Scénario: Scénario 0 import des regles des getions et formats

    Etant donné les tests effectués sur le tenant 0
    Et j'importe le fichier nommé data/rules/jeu_donnees_OK_regles_CSV_regles.csv pour le référentiel RULES
    Et j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Et j'importe le fichier nommé data/formats/DROID_SignatureFile_KO.xml dans le référentiel FORMATS
    Et j'importe le fichier nommé data/formats/DROID_SignatureFile_V88.xml dans le référentiel FORMATS
    Et les tests effectués sur le tenant 1
    Et j'importe le fichier nommé data/rules/jeu_donnees_OK_regles_CSV_regles.csv pour le référentiel RULES
    Et j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Et j'importe le fichier nommé data/formats/DROID_SignatureFile_KO.xml dans le référentiel FORMATS
    Et j'importe le fichier nommé data/formats/DROID_SignatureFile_V88.xml dans le référentiel FORMATS
