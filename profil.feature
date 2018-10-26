# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de profils

  Contexte: un profil ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 1
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Import de  profil au format XSD
    Etant donné un profil nommé data/profiles/profiles_for_tnr_xsd_ok.json
    Alors j'importe le profile d'archivage
    Etant donné un profil nommé data/profiles/profile_ok.xsd
    Et je rattache un ficher à ce profil d'archivage
    Alors les metadonnées sont
      | Code | 201 |

  Scénario: Import de deux profil de même noms
    Etant donné un profil nommé data/profiles/two_name_profiles_ok.json
    Alors j'importe le profile d'archivage


  Scénario: Recherche de profil XSD
    Quand je cherche un profil nommé profilTrnXsd
    Alors le profil existe
    Et les métadonnées du profil sont
      | Name        | profilTrnXsd            |
      | Description | Recherche de profil XSD |

  Scénario: Recherche de profil RNG
    Quand je cherche un profil nommé profilTrnRng
    Alors le profil existe
    Et les métadonnées du profil sont
      | Name        | profilTrnRng            |
      | Description | Recherche de profil RNG |
