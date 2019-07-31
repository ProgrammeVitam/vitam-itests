# language: fr

@AUP
Fonctionnalité: Tests d'import et de recherche de documents type

    Contexte: un document type ne doit être importé qu'une seule fois. Je pré-suppose que cette feature ne sera executée qu'une seule fois.
    Etant donné les tests effectués sur le tenant 1


    Scénario: Import de document type
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ok.json
    Alors je fais un import du document type
    Et le statut final du journal des opérations est OK


    Scénario: Recherche de document type
    Quand je cherche un document type nommé ArchiveUnitProfile
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfile               |
      | Description | Test d'import d'un document type |


    Scénario: Import d'un document type avec un champ obligatoire manquant - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_champs_requis_vides.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du profil d'unité archivistique: au moins un des champs obligatoires n'est pas renseigné
    Et le champ 'evDetData' de l'évenement final est : "Mandatory Fields" : "The field Name is mandatory,The field ControlSchema is mandatory"


    Scénario: Import d'un document au mauvais format -KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_mauvais_format.csv
    Quand je fais un import du document type
    Alors les metadonnées sont
      | Code | 412 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   #Le format du fichier ne correspond pas au format attendu.


    Scénario: Import d'un document type avec des valeurs incorrectes - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_incorrect_values.json
    Quand je fais un import du document type
    Alors les metadonnées sont
      | Code | 400 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Au moins un objet déclare une valeur incorrecte.


    Scénario: Import d'un document type avec injection HTML dans la description - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_injection_html_description.json
    Quand je fais un import du document type
    Alors les metadonnées sont
      | Code | 412 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Le format du fichier ne correspond pas au format attendu.


   Scénario: Import d'un document type avec injection HTML dans l'identifier - KO
   Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_injection_html_identifier.json
   Quand je fais un import du document type
   Alors les metadonnées sont
     | Code | 412 |
   # l'action n'est pas journalisée, fenêtre : Echec de l'import du fichier.
   # Le format du fichier ne correspond pas au format attendu.


    Scénario: Import de document type avec schéma et recherche du document type
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ok_custom_schema.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je cherche un document type nommé ArchiveUnitProfileWithCustomSchema
    Alors le document type existe
    Et les métadonnées du document type sont
      | Name        | ArchiveUnitProfileWithCustomSchema           |
      | Description | Test d'import d'un document type avec schéma |


    Scénario: Import de document type incluant un schéma de contrôle avec vocabulaire externe - OK
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ok_notice_schema_voc_ext_all_types.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et les métadonnées du document type sont
          | Name        | AUP_NoticeAndSchemaTNR           |
          | Description | Ce document type définit le schéma de contrôle d'une unité archivistique incluant un schéma de contrôle avec des vocabulaires externes |
          #| Fields      | ["_id","_og","ArchiveUnitProfile","DescriptionLevel","Title","MyKeyword","MyText","MyDate","MyBoolean","MyLong","MyDouble","MyGeoPoint","MyEnum"]                                 |
# comparaison des tableau à intégrer pour que cette épape fonctionne

    Scénario: Import de document type incluant un schéma de controle avec vocabulaire externe non référencé dans l'ontologie - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_notice_schema_voc_ext_unknown.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : !ArchiveUnitProfile service error!
    Et le champ 'evDetData' de l'évenement final est : "archiveUnitProfileCheck" : "The field blabla specified in the schema is not declared in ontology"


    Scénario: Import de document type incluant un schéma de controle avec vocabulaire externe  de type inconnu - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_notice_schema_voc_ext_unknown_type.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du profil d'unité archivistique: schéma JSON non valide
    #Et le champ 'evDetData' de l'évenement final est : "Invalid JSON schema"" : "The field ControlSchema is not a json schema"
#le comportement sur la comparaison de evDetData est différent sur ce cham : utilisation de prettyPtint


    Scénario: Import de document type incluant un schéma de controle invalide - KO
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ko_notice_schema_voc_ext_incorrect_scheme.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import du profil d'unité archivistique: schéma JSON non valide
  #  Et le champ 'evDetData' de l'évenement final est : "Invalid JSON schema"" : "The field ControlSchema is not a json schema"

    # do this test on a tenant that does not allow same identifier
    Scénario: Import d'un document type déjà existant - KO
    Etant donné les tests effectués sur le tenant 0
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ok.json
    Alors je fais un import du document type
    Et le statut final du journal des opérations est OK
    Etant donné un document type nommé data/archiveUnitProfiles/aup_ok.json
    Quand je fais un import du document type
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le champ 'evDetData' de l'évenement final est : "Duplicate Field" : "The archive unit profile identifier AUP_IDENTIFIER already exists in database"