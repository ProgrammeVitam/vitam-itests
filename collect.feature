# language: fr

@Collect
Fonctionnalité: Opérations de collecte de données pour construire un SIP consommable par VITAM

Contexte: Vérifier collect service
  Etant donné Le module de collect est deployé
  Et les tests effectués sur le tenant 0


  Scénario: Gestion du cycle de vie d'un projet de collecte de données
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je recherche le projet
    Et je met a jour le projet avec le nom updateName
    Et je supprime le projet
    Alors le projet est supprimé en succès

  Scénario: Gestion du cycle de vie d'une transaction de collecte de données
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je recherche le projet
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction 
    Et j'utilise le fichier json suivant data/queries/collect/upload_au_collect.json
    Et je crée une au
    Et je recherche l'au par rapport à son titre
    Et j'utilise le fichier json suivant data/queries/collect/upload_got_collect.json
    Et je crée un GOT
    Et j'upload le fichier suivant data/queries/collect/plan-barbusse.txt
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK 

  Scénario: Gestion du cycle de vie d'une transaction de collecte de données ko
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je recherche le projet
    Et j'utilise le fichier json suivant data/queries/collect/create_transactionWithError.json
    Et j'initialise une transaction
    Et je recherche la transaction 
    Et j'utilise le fichier json suivant data/queries/collect/upload_au_collect.json
    Et je crée une au
    Et je recherche l'au par rapport à son titre
    Et j'utilise le fichier json suivant data/queries/collect/upload_got_collect.json
    Et je crée un GOT
    Et j'upload le fichier suivant data/queries/collect/plan-barbusse.txt
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut KO depuis l'ingest et je constate son statut ACK_KO 


  Scénario: Gestion d'une arborescence bureautique et purge du projet
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction 
    Et je met a jour la transaction avec le nom updatedTransactionName
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/sample_stream.zip
    Et je constate qu'une AU ainsi qu'un GOT sont créés

  Scénario: Gestion d'une arborescence bureautique et MAJ des métadonnées via CSV et purge du projet
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/SIP_Paie.zip
    Et j'envoie un fichier de mise à jour CSV data/queries/collect/metadata_maj.csv
    Et je constate que des métadonnées correspondent au fichier json data/expectedJson/Result_Csv_ExpectedUnites.json
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK

  Scénario: Gestion d'une arborescence bureautique et MAJ des métadonnées via JSONL et purge du projet
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/SIP_Paie.zip
    Et j'envoie un fichier de mise à jour JSONL data/queries/collect/metadata_maj.jsonl
    Et je constate que des métadonnées correspondent au fichier json data/expectedJson/Result_Csv_ExpectedUnites.json
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK



  Scénario: Rattachement unique
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/OK_arbre_AN.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche une unité archivistique et je recupère son id
    Et j'utilise le fichier json suivant data/queries/collect/create_project_with_rattachement.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et je met a jour la transaction avec le nom updatedTransactionName
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/sample_stream.zip
    Et je constate qu'une AU ainsi qu'un GOT sont créés
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche les unités archivistiques
    Et je vérifie que l'unité est rattaché au noeud de l'arbre de positionnement



  Scénario: Rattachement clé valeur
    Etant donné un fichier SIP nommé data/queries/collect/Import_arbre.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche une unité archivistique et je recupère son id
    Et j'utilise le fichier json suivant data/queries/collect/create_project_with_rattachement_cle_valeur.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et je met a jour la transaction avec le nom updatedTransactionName
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/sample_stream_with_metadata.zip
    Et je constate qu'une AU ainsi qu'un GOT sont créés
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK
    Et j'utilise le fichier de requête suivant data/queries/select_units_by_operation_id.json
    Et je recherche les unités archivistiques
    Et je vérifie que l'unité est rattaché au noeud de l'arbre de positionnement



  Scénario: Gestion d'une arborescence bureautique intégrant un fichier métadonnées JSONL et purge du projet
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et j'envoie l'arborescence bureautique suivante data/queries/collect/SIP_Paie_MetadataJsonl.zip
    Et je constate que des métadonnées correspondent au fichier json data/expectedJson/Result_Csv_ExpectedUnites.json
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK


  Scénario: Gestion d'une arborescence bureautique et MAJ des métadonnées via SIP
    Etant donné les tests effectués sur le tenant 0
    Quand j'utilise le fichier json suivant data/queries/collect/create_project.json
    Et j'initialise le project
    Alors le projet est créé en succès
    Et je met a jour le projet avec le nom updatedProjectName
    Et j'utilise le fichier json suivant data/queries/collect/create_transaction.json
    Et j'initialise une transaction
    Et je recherche la transaction
    Et j'importe le sip suivant data/SIP_OK/ZIP/4_UNITS_2_GOTS.zip
    Et je constate que des métadonnées correspondent au fichier json data/expectedJson/Result_SIP_ExpectedUnites.json
    Et je clôture et je constate son statut READY ou VALIDATED
    Et j'envoie le SIP et je constate son statut SENT
    Et je reçois un statut OK depuis l'ingest et je constate son statut ACK_OK