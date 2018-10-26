# language: fr

@Ontology
Fonctionnalité: Import de vocabulaire externe dans l'ontologie

  Contexte: Avant de lancer cette suite de test, je vérifie que je suis bien sur le tenant d'administration
    Etant donné les tests effectués sur le tenant 1

  Scénario: restauration de l'ontologie
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie

  Scénario: Vérification et import d'une ontologie au bon format
    Etant donné un fichier ontologie nommé data/ontology/ok_ontology_voc_ext_all_types.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
    | Code | 200 |
    Et le statut final du journal des opérations est OK
    Et le champ 'outMessg' de l'évenement final est : Succès du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie au mauvais format
    Quand un fichier ontologie nommé data/ontology/ko_ontologie_format.csv
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 412 |



  Scénario: Vérification et import d'une ontologie avec un 2 identifiants identiques et de même casse
    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
    Quand j'importe l'ontologie
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_same_identifier.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie

#  Bug  a crrer
#  Scénario: Vérification et import d'une ontologie avec un 2 identifiants identiques et de casses différentes
#    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_same_identifier_different_casse.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 400 |
#    Et le statut final du journal des opérations est KO
#    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec espace
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_with_space.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec diese
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_with_diese.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec underscore
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_with_diese.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie avec un identifiant invalide - identifiant avec espace entourant l'identifiant
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_with_blank.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Vérification et import d'une ontologie avec un fichier json invalide
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_invalid_json.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 412 |

    #depend de la configuration de la plateforme

#  Scénario: Vérification et import d'une ontologie avec un champ interne défini comme externe
#    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 200 |
#    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_internal_becomes_external.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 400 |
#    Et le statut final du journal des opérations est KO
#    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


  Scénario: Import d'un vocabulaire de type inconnu dans l'ontologie
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_type_unknown.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
# Pas de journal  Et le statut final du journal des opérations est KO

  Scénario: Import d'un vocabulaire avec champ obligatoire absent
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_voc_ext_with_mandatory_field_absent.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 400 |
    Et le statut final du journal des opérations est KO
    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie


    # doit etre ok mais  pas de champs blabla
#  Scénario: Import d'un vocabulaire avec champ json inconnu
#    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 200 |
#    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_json_field_unknown.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 400 |

  Scénario: Import d'un vocabulaire avec injection de Html
    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_html_injection.json
    Quand j'importe l'ontologie
    Alors les metadonnées sont
      | Code | 412 |
## Bug a créer
# crée une collection blabla
#  Scénario: Import d'un vocabulaire avec une collection inconnue
#    Etant donné un fichier ontologie nommé data/ontology/vitam_ontology.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 200 |
#    Etant donné un fichier ontologie nommé data/ontology/ko_ontology_unknown_collection.json
#    Quand j'importe l'ontologie
#    Alors les metadonnées sont
#      | Code | 400 |
#    Et le statut final du journal des opérations est KO
#    Et le champ 'outMessg' de l'évenement final est : Échec du processus d'import de l'ontologie
#
#
