# language: fr

@Agencies
Fonctionnalité: Tests d'imports et de recherche de services producteurs

  Contexte: un service producteur ne doit etre importé q'une seule fois. je pre-suppose que ce feature ne sera executé qu'une seule fois.
    Etant donné les tests effectués sur le tenant 0

##### dans le cas de plate forme non nettoyée, il se peut que l'on obtienne un warning (agencies modifiées et agencies utilisées par des AU)

    @Light
    Scénario: Tentative d'import de  service producteur (fichier csv)
    Etant donné un fichier de service producteur nommé data/agencies/agencies.csv
    Alors j'importe les services producteurs
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK|WARNING

# Import d'un fichier de service producteur - Cas KO

    Scénario: Import d'un fichier déclarant un service producteur sans identifiant
    Etant donnée un fichier de service producteur nommé data/agencies/KO_agencies_init_champ_manquant.csv
    Quand j'importe les services producteurs sans échec
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des services agents
    Et le champ 'evDetData' de l'évenement final est : Import agency error > Invalid CSV File


    Scénario: Import d'un fichier de services agents avec de mauvais séparateur
    Etant donné un fichier de service producteur nommé data/agencies/KO_agencies_mauvais_separateur.csv
    Quand j'importe les services producteurs sans échec
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des services agents
    Et le champ 'evDetData' de l'évenement final est : Import agency error > File invalid -- lack of column Identifier


    #Scénario: Import d'un fichier de services agents non encodé en UTF8
    #Etant donnée un fichier de service producteur nommé data/agencies/KO_agencies_init_pas_UTF8.csv
    #Quand j'importe les services producteurs sans échec
    #Et je recherche le journal des opérations
    #Alors le statut final du journal des opérations est KO
    #KO sera corrigé par le bugs


    Scénario: Import d'un fichier avec suppression d'un service producteur utilisé dans le système
    Etant donnée un fichier de service producteur nommé data/agencies/agencies_init_description.csv
    Alors j'importe les services producteurs
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Test_Agencies.zip
    Alors je télécharge le SIP
    Etant donnée un fichier de service producteur nommé data/agencies/agencies_init_sans_VitamTNR.csv
    Quand j'importe les services producteurs sans échec
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement IMPORT_AGENCIES est IMPORT_AGENCIES.DELETION.KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du référentiel des services agents : des services agents supprimés sont référencés par des unités archivistiques déjà présentes dans le système
    Et le champ 'evDetData' de l'évenement final est : \"Agencies \":\"VitamTNR\"

    Scénario: Import d'un fichier avec suppression d'un service producteur non utilisé dans le système
    Etant donnée un fichier de service producteur nommé data/agencies/agencies_init_description.csv
    Quand j'importe les services producteurs sans échec
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Etant donnée un fichier de service producteur nommé data/agencies/agencies_init_delete_unused_agencies.csv
    Quand j'importe les services producteurs sans échec
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK


# Controle de l'existence d'un service agent

    Scénario: Contrôle de l'existence des services agents - Service producteur existant & service versant inexistant
    Etant donné un fichier de service producteur nommé data/agencies/agencies_init_description.csv
    Et j'importe les services producteurs
    Et un fichier SIP nommé data/SIP_KO/ZIP/KO_OKSP_KOSV.zip
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'entrée du SIP
    Et le statut de l'événement CHECK_HEADER.CHECK_AGENT est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO


    Scénario: Contrôle de l'existence des services agents - Service producteur et versant absents du référentiel
    Etant donné un fichier de service producteur nommé data/agencies/agencies_init_description.csv
    Et j'importe les services producteurs
    Et un fichier SIP nommé data/SIP_KO/ZIP/KO_ORIGINATINGAGENCY_ET_SUBMISSIONAGENCY_PAS_REFERENTIEL_AGENTS.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'entrée du SIP
    Et le statut de l'événement CHECK_HEADER.CHECK_AGENT est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO


    Scénario: Contrôle de l'existence des services agents - Service producteur inexistant & service versant existant
    Etant donné un fichier de service producteur nommé data/agencies/agencies_init_description.csv
    Et j'importe les services producteurs
    Et un fichier SIP nommé data/SIP_KO/ZIP/KO_KOSP_OKSV.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'entrée du SIP
    Et le statut de l'événement CHECK_HEADER.CHECK_AGENT est KO
    Et l'outcome détail de l'événement CHECK_HEADER.CHECK_AGENT est CHECK_HEADER.CHECK_AGENT.UNKNOWN.KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO


# Recherche d'un service producteur

    Scénario: Recherche de service producteur
    Quand je cherche un service producteur nommé VitamTNR
    Alors le service producteur existe
    Et les métadonnées du service sont
    | Name        | VitamTNR            |
    | Description | une description de service agent VitamTNR |