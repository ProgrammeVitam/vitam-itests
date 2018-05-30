# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherche de services producteurs

  Contexte: un service producteur ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 0

##### dans le cas de plate forme non nettoyée, il se peut que l'on obtienne un warning (agencies modifiées et agencies utilisées par des AU)

  Scénario: Tentative d'import de  service producteur (fichier csv)
    Etant donné un fichier de service producteur nommé data/agencies/agencies.csv
    Alors j'importe les services producteurs
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK|WARNING
  Scénario: Recherche de service producteur
    Quand je cherche un service producteur nommé agencyTNR
    Alors le service producteur existe
    Et les métadonnées du service sont
      | Name        | agencyTNR            |
      | Description | une description de service agent TNR0001 |
