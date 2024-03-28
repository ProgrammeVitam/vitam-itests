# language: fr

@OntologyUpdate
Fonctionnalité: Import de vocabulaire externe dans l'ontologie

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1


  Scénario: restauration ontology
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie

  Scénario: recherche ontology my_text_text_to_keyword
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_my_text_text_to_keyword.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyText
    Alors le type du vocabulaire est KEYWORD
    Alors le type détaillé du vocabulaire est STRING
    Et la taille de la chaîne de caractère du vocabulaire est MEDIUM
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie


  Scénario: recherche ontology my_text_text_to_keyword
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_my_geo_point_geo_point_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyGeoPoint
    Alors le type du vocabulaire est TEXT
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie



  Scénario: recherche ontology my_date_date_to_text
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_my_date_date_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyDate
    Alors le type du vocabulaire est TEXT
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie


  Scénario: recherche ontology my_date_date_to_keyword
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_my_date_date_to_keyword.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyDate
    Alors le type du vocabulaire est KEYWORD
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie


  Scénario: recherche ontology my_keyword_to_text
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_my_keyword_keyword_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyKeyword
    Alors le type du vocabulaire est TEXT
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie


  Scénario: recherche ko ontology my_keyword_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to GEO_POINT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_text_text_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyText: Change of type from TEXT to ENUM is not possible

  Scénario: recherche ko ontology keyword_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_keyword_keyword_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyKeyword: Change of type from KEYWORD to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_keyword_keyword_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyKeyword: Change of type from KEYWORD to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_keyword_keyword_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyKeyword: Change of type from KEYWORD to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_keyword_keyword_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyKeyword: Change of type from KEYWORD to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_keyword_keyword_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyKeyword: Change of type from KEYWORD to GEO_POINT is not possible




#

  Scénario: recherche ko ontology date_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_date_date_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDate: Change of type from DATE to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_date_date_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDate: Change of type from DATE to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_date_date_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDate: Change of type from DATE to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_date_date_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDate: Change of type from DATE to GEO_POINT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_date_date_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDate: Change of type from DATE to ENUM is not possible




  Scénario: recherche ko ontology long_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_keyword.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to KEYWORD is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to TEXT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to ENUM is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_long_long_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyLong: Change of type from LONG to GEO_POINT is not possible




  Scénario: recherche ko ontology double_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_keyword.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to KEYWORD is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to TEXT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to GEO_POINT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_double_double_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyDouble: Change of type from DOUBLE to ENUM is not possible




  Scénario: recherche ko ontology boolean_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_keyword.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to KEYWORD is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_text.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to TEXT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to GEO_POINT is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_boolean_boolean_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyBoolean: Change of type from BOOLEAN to ENUM is not possible



  Scénario: recherche ko ontology geopoint_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_geo_point_geo_point_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyGeoPoint: Change of type from GEO_POINT to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_geo_point_geo_point_to_long.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyGeoPoint: Change of type from GEO_POINT to LONG is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_geo_point_geo_point_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyGeoPoint: Change of type from GEO_POINT to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_geo_point_geo_point_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyGeoPoint: Change of type from GEO_POINT to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_geo_point_geo_point_to_enum.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyGeoPoint: Change of type from GEO_POINT to ENUM is not possible


#
  Scénario: recherche ko ontology enum_to_others
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_enum_enum_to_date.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyEnum: Change of type from ENUM to DATE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_enum_enum_to_double.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyEnum: Change of type from ENUM to DOUBLE is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_enum_enum_to_boolean.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyEnum: Change of type from ENUM to BOOLEAN is not possible
    Etant donné un fichier ontologie nommé data/ontology/types/ko_ontology_voc_ext_my_enum_enum_to_geo_point.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
    Et le champ 'evDetData' de l'évenement final est : ontologyCheck" : "MyEnum: Change of type from ENUM to GEO_POINT is not possible

  Scénario: valeurs par défaut pour les type détaillés et la taille des chaînes de caractère
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 200 |
    Et le statut final du journal des opérations est OK
    Etant donné un fichier ontologie nommé data/ontology/types/ok_ontology_voc_ext_no_type_detail.json
    Quand j'importe l'ontologie
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie
    Quand je recherche le vocabulaire intitulé MyKeyword
      Alors le type du vocabulaire est KEYWORD
      Et le type détaillé du vocabulaire est STRING
      Et la taille de la chaîne de caractère du vocabulaire est MEDIUM
    Quand je recherche le vocabulaire intitulé MyText
      Alors le type du vocabulaire est TEXT
      Et le type détaillé du vocabulaire est STRING
      Et la taille de la chaîne de caractère du vocabulaire est MEDIUM
    Quand je recherche le vocabulaire intitulé MyDate
      Alors le type du vocabulaire est DATE
      Et le type détaillé du vocabulaire est DATETIME
      Et la taille de la chaîne de caractère du vocabulaire est indéfinie
    Quand je recherche le vocabulaire intitulé MyBoolean
      Alors le type du vocabulaire est BOOLEAN
      Et le type détaillé du vocabulaire est BOOLEAN
      Et la taille de la chaîne de caractère du vocabulaire est indéfinie
    Quand je recherche le vocabulaire intitulé MyLong
      Alors le type du vocabulaire est LONG
      Et le type détaillé du vocabulaire est LONG
      Et la taille de la chaîne de caractère du vocabulaire est indéfinie
    Quand je recherche le vocabulaire intitulé MyDouble
      Alors le type du vocabulaire est DOUBLE
      Et le type détaillé du vocabulaire est DOUBLE
      Et la taille de la chaîne de caractère du vocabulaire est indéfinie
    Quand je recherche le vocabulaire intitulé MyGeoPoint
      Alors le type du vocabulaire est GEO_POINT
      Et le type détaillé du vocabulaire est STRING
      Et la taille de la chaîne de caractère du vocabulaire est MEDIUM
    Quand je recherche le vocabulaire intitulé MyEnum
      Alors le type du vocabulaire est ENUM
      Et le type détaillé du vocabulaire est ENUM
      Et la taille de la chaîne de caractère du vocabulaire est indéfinie
