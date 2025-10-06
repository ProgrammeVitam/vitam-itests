# language: fr

@Collect
@CollectIngest
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

  Contexte: Projet existant dans collect
    Étant donné Le module de collect est deployé
    Et les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et que j'importe ce contrat sans échec de type INGEST_CONTRACTS
    Et que j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Et que le projet est créé en succès

# FIXME : No siegfried check in collect-external
#  Scénario: Import dans collect d'un SIP au mauvais format
#    Quand j'initialise une transaction
#    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_SIP_Mauvais_Format.pdf
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est KO

  Scénario: Import dans collect d'un SIP avec virus
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    # FIXME : OG_OBJECTS_ANTIVIRUS_CHECK vs SANITY_CHECK_SIP
    Et le statut de l'événement OG_OBJECTS_ANTIVIRUS_CHECK est KO

# FIXME : Failure but with HTTP 500
#  Scénario: Import dans collect d'un SIP avec un fichier dont l'extension contient un caractère spécial
#    Quand j'initialise une transaction
#    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_FILE_extension_caractere_special.zip
#    Et je recherche le journal des opérations
#    Alors le statut final du journal des opérations est KO
#    Et les statuts des événements STP_UPLOAD_SIP, PROCESS_SIP_UNITARY sont KO