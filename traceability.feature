# language: fr

@Traceability
Fonctionnalité: Génération journal des opérations sécurisé
	Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte: Avant de lancer cette suite de tests, je présuppose qu'un contrat d'accès est chargé.
    Etant donné les tests effectués sur le tenant 0
    Etant donné les tests effectués sur le contrat id contrat_EveryOriginatingAgency_true
    Et un contract nommé data/contracts/contract_access_every_originating_agency.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS

  #### Logbook operation traceability ####
  Scénario: Sécurisation du journal d’opération OK
    Quand je génère un journal des opérations sécurisé
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les statuts des événements STP_OP_SECURISATION, OP_SECURISATION_TIMESTAMP, OP_SECURISATION_STORAGE sont OK

  #### AU Ingest ####
  Scénario: Test audit d'une AU
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_having_object_group.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique ayant un groupe d'objets et je recupère son id et son objet
    # Audit without traceability
    Quand je réalise un audit de traçabilité de l'unité
    Alors le journal d'opération de l'audit de traçabilité a pour statut WARNING
    # Audit with traceability
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'unité
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK

  #### AU Update ####
  Scénario: Test audit d'une AU après MAJ
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_having_object_group.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique ayant un groupe d'objets et je recupère son id et son objet
    # Audit with traceability
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'unité
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK
    # MAJ de l'AU
    Quand j'utilise la requête suivante
"""
{
  "$action": [
    { "$set": { "Title": "New Title" } }
  ]
}
"""
    Et je modifie les unités archivistiques
    Alors le nombre de résultat est 1
    # Audit sans traçabilité
    Quand je réalise un audit de traçabilité de l'unité
    Alors le journal d'opération de l'audit de traçabilité a pour statut WARNING
    # Audit avec traçabilité
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'unité
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK

  #### GOT Ingest ####
  Scénario: Test audit d'un GOT
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_having_object_group.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique ayant un groupe d'objets et je recupère son id et son objet
    # Audit without traceability
    Quand je réalise un audit de traçabilité de l'objet group
    Alors le journal d'opération de l'audit de traçabilité a pour statut WARNING
    # Audit with traceability
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'objet group
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK

  ##### GOT Update : Attach AU to existing GOT ####
  Scénario: Test audit d'un GOT suite à son rattachement
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_having_object_group.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique ayant un groupe d'objets et je recupère son id et son objet
    # Audit with traceability
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'objet group
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK
    # Attach AU to existing GOT
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_attachment_to_existing_GOT.zip
    Et je construit le SIP de rattachement au groupe d'objet existant avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    # Audit without traceability
    Quand je réalise un audit de traçabilité de l'objet group
    Alors le journal d'opération de l'audit de traçabilité a pour statut WARNING
    # Audit with traceability
    Quand on lance la traçabilité des journaux de cycles de vie
    Quand je réalise un audit de traçabilité de l'objet group
    Alors le journal d'opération de l'audit de traçabilité a pour statut OK
