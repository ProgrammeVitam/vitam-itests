# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de services producteurs

  Contexte: un service producteur ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 0

  Scénario: Tentative d'import de  service producteur (fichier csv)
    Etant donné un fichier de service producteur nommé data/agencies/agencies.csv
    Alors j'importe les service producteurs

  Scénario: Recherche de service producteur
    Quand je cherche un service producteur nommé agencyTNR
    Alors le service producteur exite
    Et les métadonnées du service sont
      | Name        | agencyTNR            |
      | Description | une description de service agent TNR0001 |
