# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches  de profils

  Contexte: un profil ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Import de  profil au format RNG
    Etant donné un profil nommé data/profiles/profiles_for_tnr_rng_ok.json
    Alors je fais un import du profile d'archivage
    Etant donné un profil nommé data/profiles/profile_ok.rng
    Et je rattache un ficher à ce profil d'archivage


  Scénario: Import de  profil au format XSD
    Etant donné un profil nommé data/profiles/profiles_for_tnr_xsd_ok.json
    Alors je fais un import du profile d'archivage
    Etant donné un profil nommé data/profiles/profile_ok.xsd
    Et je rattache un ficher à ce profil d'archivage

  Scénario: Recherche de profil XSD - Recherche de profil XSD
    Quand je cherche un profil nommé profilTrnXsd
    Alors le profil existe
    Et les métadonnées du profil sont
      | Name        | profilTrnXsd            |
      | Description | Recherche de profil XSD |

  Scénario: Recherche de profil RNG - Recherche de profil RNG
    Quand je cherche un profil nommé profilTrnRng
    Alors le profil existe
    Et les métadonnées du profil sont
      | Name        | profilTrnRng            |
      | Description | Recherche de profil RNG |




