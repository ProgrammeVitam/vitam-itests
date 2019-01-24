# language: fr

@_init
Fonctionnalité: initialisation

  Scénario: Scénario 0 import des regles des getions et formats et des ...

    Etant donné les tests effectués sur le tenant 0
    Etant donné un fichier de service producteur nommé data/agencies/agencies_init.csv
    Etant donné les jeux de tests réinitialisés
    Alors j'importe les services producteurs sans échec
    Et j'importe le fichier nommé data/rules/jeu_donnees_OK_regles_CSV_regles.csv pour le référentiel RULES
    Et j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Scénario 01 import des services producteurs
    Etant donné les tests effectués sur le tenant 1
    Etant donné un fichier de service producteur nommé data/agencies/agencies_init.csv
    Alors j'importe les services producteurs sans échec

  Scénario: Scénario 1 import des regles des getions et formats et des ...
    Et les tests effectués sur le tenant 1
    Et j'importe le fichier nommé data/rules/jeu_donnees_OK_regles_CSV_regles.csv pour le référentiel RULES
    Et j'importe le fichier nommé data/rules/jeu_donnees_KO_regles_CSV.csv dans le référentiel RULES
    Et j'importe le fichier nommé data/formats/DROID_SignatureFile_V94.xml dans le référentiel FORMATS
    Et un contract nommé data/contracts/contract_acces_TNR_tenant_1.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Scénario importer un profil d'archivage et un contrat d'entrée qui déclare ce profil
    Etant donné les tests effectués sur le tenant 1
    Et un profil nommé data/profiles/profiles_for_tnr_rng_ok.json
    Alors j'importe le profile d'archivage sans échec
    Etant donné un profil nommé data/profiles/profil_ok.rng
    Et je rattache un ficher à ce profil d'archivage sans échec
    Etant donné un contract nommé data/contracts/contract_with_profil.json
    Alors j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Mise à jour du contextes avec les bons contrats d'accès et d'entrée OK
    Et les tests effectués sur le tenant 1
    Etant donné  un fichier requete nommé data/queries/update/ok/update_context_enable_control_true.json
    Alors je modifie le contexte dont l'identifiant est CT-000001 le statut de la requête est 200
