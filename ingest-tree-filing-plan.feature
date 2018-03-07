# language: fr

@Ingest
Fonctionnalité: uploader des fichier arbre et plan

Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Télécharger un plan et rattacher un SIP sur le plan par contrat d'entrée (US_1900 US_2212 US_2213)
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/test_plan.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'importe le contrat d'entrée avec le noeud de rattachement dont le titre est testPlan3
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_LINK_BY_CONTRACT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK

  Scénario: Télécharger un arbre
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/OK_arbre_AN.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Télécharger un plan mauvais classification level
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_plan_classification_Level.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

### Rattachement Unit

  Scénario: Rattachement d'une unit de sip à une unit de  sip
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement_SIP.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Rattachement d'une unit de sip à une unit de plan
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_plan.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitlePlan
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement_SIP.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Rattachement d'une unit de sip à une unit d'arbre
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_arbre.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est WARNING
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitleArbre
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement_SIP.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

### Rattachement Plans

  Scénario: Rattachement d'une unit de  plan  à une unit de sip
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario: Rattachement d'une unit de plan à une unit de plan
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_plan.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitlePlan
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: Rattachement d'une unit de plan à une unit d'arbre
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_arbre.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitleArbre
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

### Rattachement Arbre

  Scénario: Rattachement d'une unit d'arbre  à une unit de sip
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_SIP.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitle
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario: Rattachement d'une unit d'arbre à une unit de plan
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_plan.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitlePlan
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO

  Scénario: Rattachement d'une unit d'arbre à une unit d'arbre
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement_arbre.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand j'utilise le fichier de requête suivant data/queries/select_units_by_title_parameters.json
    Et j'utilise dans la requête le paramètre TITLE_PARAM avec la valeur RattachementUnitTnrTitleArbre
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/Attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK

  Scénario: import d'un arbre avec balise title vide (bug 3941)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_Plan_empty_title.zip
    Quand je télécharge le plan
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO

  Scénario: import d'un plan avec balise title vide (bug 3941)
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_Arbre_empty_title.zip
    Quand je télécharge l'arbre
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et l'outcome détail de l'événement CHECK_UNIT_SCHEMA est CHECK_UNIT_SCHEMA.INVALID_UNIT.KO
