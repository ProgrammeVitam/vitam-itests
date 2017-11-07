# language: fr

@Ingest
Fonctionnalité: uploader des fichier arbre et plan

Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0

  Scénario: Télécharger un plan et rattacher un SIP sur le plan par contrat d'entrée (US_1900 US_2212 US_2213)
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/test_plan.zip
    Quand je télécharge le plan
    Alors le statut final du journal des opérations est OK
    Quand j'importe le contrat d'entrée avec le noeud de rattachement dont le titre est testPlan3
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_LINK_BY_CONTRACT.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK

  Scénario: Télécharger un plan avec workflow de ingest
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/test_plan.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING

  Scénario: Télécharger un arbre
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/OK_arbre_AN.zip
    Quand je télécharge l'arbre
    Alors le statut final du journal des opérations est OK

  Scénario: Ttélécharger un arbre avec workflow de ingest
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/OK_arbre_AN.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING


  Scénario: Ratachement d'une unit de sip à une unit de  sip
    Etant donné un fichier SIP nommé data/SIP_OK/US_1900_2011/OK_arbre_AN.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est WARNING

  Scénario: Ratachement d'une unit d'arbre  à une unit de sip
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_Rattachement.zip
    Quand je télécharge le SIP
    Alors le statut final du journal des opérations est OK
    Et j'utilise la requête suivante
"""
  { "$roots": [], "$query": [{"$and":[{"$eq":{"Title":"RattachementUnitTnrTitle"}}]}], "$projection": {}}

"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge l'arbre
    Alors le statut final du journal des opérations est KO

  Scénario: Ratachement d'une unit de  plan  à une unit de sip
    Quand j'utilise la requête suivante
"""
  { "$roots": [], "$query": [{"$and":[{"$eq":{"Title":"RattachementUnitTnrTitle"}}]}], "$projection": {}}

"""
    Et je recherche une unité archivistique et je recupère son id
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_attachement.zip
    Et je construit le sip de rattachement avec le template
    Et je télécharge le plan
    Alors le statut final du journal des opérations est KO

