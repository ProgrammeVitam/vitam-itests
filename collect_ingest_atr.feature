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

  @Light
  Scénario: Import dans collect d'un SIP avec virus
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le journal ne contient pas de statut FATAL
    Et le journal des opérations est cohérent
    Et le statut de l'événement OG_OBJECTS_ANTIVIRUS_CHECK est KO

  @Light
  Scénario: Import dans collect d'un SIP OK
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le journal des opérations est cohérent

  Scénario: Import dans collect d'un SIP avec Physical OK
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je valide la transaction sans erreur
    Alors je constate que la transaction passe au statut VALIDATED
    Quand je télécharge le SIP de la transaction
    Alors le manifest généré de la transaction contient 1 unité archivistique
    Et le manifest généré de la transaction contient 1 objet binaire
    Et le manifest généré de la transaction contient 1 objet physique

  Scénario: Import dans collect d'un SIP avec cycle
    Quand j'initialise une transaction
    Et que j'importe le sip suivant data/SIP_KO/ZIP/KO_CYCLE.zip
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le journal ne contient pas de statut FATAL
    Et le journal des opérations est cohérent
    Et les statuts des événements CHECK_DATAOBJECTPACKAGE, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST sont KO
    Et le résultat de l'événement CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST est CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_LOOP.KO
