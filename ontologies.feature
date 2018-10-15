# language: fr

@Ontology
Fonctionnalité: Import de vocabulaire externe dans l'ontologie

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1

  Scénario: Vérification et import d'une ontologie au bon format
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Et j'importe l'ontologie en mode force
    Alors le statut final du journal des opérations est OK

#    Alors les metadonnées sont
#      | Code | 200 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche le journal des opérations
#    Alors le statut de l'événement IMPORT_ONTOLOGY est OK
#    Et l'outcome détail de l'événement IMPORT_ONTOLOGY est IMPORT_ONTOLOGY.OK
#      #  | outMessg | "{"Succès du processus d\'import de l'ontologie"}" |

#  Scénario: Vérification et import d'une ontologie au mauvais format
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontologie_format.csv pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#
#  Scénario: Vérification et import d'une ontologie avec un 2 identifiants identiques et de même casse
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_voc_ext_same_identifier.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un 2 identifiants identiques et de casses différentes
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_voc_ext_same_identifier_different_casse.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec espace
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_voc_ext_identifer_withSpace.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec diese
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_vocExt_WithDiese.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec underscore
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_vocExt_WithDiese.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec espace entourant l'identifiant
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_vocExt_WithBlank.json.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un fichier json invalide
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_invalidJson.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Vérification et import d'une ontologie avec un champ interne défini comme externe
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_InternalBecomesExternal.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Import d'un vocabulaire de type inconnu dans l'ontologie
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_vocExt_TypeUnknown.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Import d'un vocabulaire avec champ obligatoire absent
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_vocExt_WithMandatoryFieldAbsent.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Import d'un vocabulaire avec champ json inconnu
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_JSONFieldUnknown.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Import d'un vocabulaire avec injection de Html
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_HTMLinjection.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#  Scénario: Import d'un vocabulaire avec une collection inconnue
#    Quand je vérifie le fichier nommé data/ontolologies/ko_ontology_UnknownCollection.json pour le référentiel ONTOLOGIES
#    Alors les metadonnées sont
#      | Code | 400 |
#    Quand j'utilise le fichier de requête suivant data/queries/select_logbook_operation_by_id.json
#    Et je recherche les journaux d'opération
#    Alors les metadonnées sont
#      | evDetData | "{}" |
#
#
