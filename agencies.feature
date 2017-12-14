# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de services producteurs

  Contexte: un service producteur ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 2

# todo: supprimer une description du fichier
  Scénario: Double import d'un référentiel de service agent à l'identique
    Etant donné un fichier de service producteur nommé data/agencies/agencies.csv
    Alors j'importe les service producteurs
    # Quand j'importe les services producteurs
    # +Tester que l'import est OK
    # Quand j'importe les services producteurs
    # +Tester que l'import est OK

  Scénario: Recherche de service agent
    Quand je cherche un service producteur nommé agencyTNR
#    Alors le service producteur exite
    Et les métadonnées du service sont
      | Name        | agencyTNR            |
      | Description | une description de service agent TNR0001 |

    Scénario: mise à jour : modification de service agent
    Etant donné un fichier de service producteur nommé data/agencies/agencies_modif.csv
    Quand je cherche un service producteur nommé nouveau_nom
  #    Alors le service producteur exite
  # Quand je cherche un service producteur dont la description est nouvelle_description
 #    Alors le service producteur exite
 # Quand je cherche un service producteur dont l'identifiant est nouvel_identifiant
#    Alors le service producteur exite

  Scénario: mise à jour : modification de service agent
  Etant donné un fichier de service producteur nommé data/agencies/agencies_modif.csv
  Quand je cherche un service producteur nommé nouveau_nom
  #    Alors le service producteur exite
  # Quand je cherche un service producteur dont la description est nouvelle_description
  #    Alors le service producteur exite
  # Quand je cherche un service producteur dont l'identifiant est nouvel_identifiant
  #    Alors le service producteur exite

  Scénario: test d'unicité sur l'identifiant
  Etant donné un fichier de service producteur nommé data/agencies/agencies_deux_identifiants.csv
    # Quand j'importe les services producteurs
  #    Alors le service producteur exite
  # Quand je cherche un service producteur dont la description est nouvelle_description
  #    Alors le service producteur exite
  # Quand je cherche un service producteur dont l'identifiant est nouvel_identifiant
  #    Alors le service producteur exite
