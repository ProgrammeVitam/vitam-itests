# language: fr

@Contacts
Fonctionnalité: Tests d'imports et de recherches de contexte (entrée et accès)

  Contexte: Avant de lancer cette suite de test, je verifie qu'au moins un contrat est uploadé.
    Etant donné les tests effectués sur le tenant 1

  Scénario: Import de contexte OK
    Etant donné un fichier contexte nommé data/contexts/contexts_empty.json
    Alors j'importe ce contexte en succès

  Scénario: Import de contexte KO, car il contient contrat d'entrée ou contrat d'acceès invalide
    Etant donné un fichier contexte nommé data/contexts/contexts_error.json
    Alors j'importe ce contexte en échec

  Scénario: Mise à jour du contextes OK
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update_context.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 200
    Et je recherche un contexte nommé My_Context_i8
    Alors  les métadonnées du context sont
      | Name        | My_Context_i8                                                                                                                                                                                                          |
      | Permissions | [{"#tenant":0},{"#tenant":1},{"#tenant":2}] |

  Scénario: Mise à jour du contextes unset security profile KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_unset_security_profile.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400

  Scénario: Mise à jour du contextes unset status KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_unset_status.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400

  Scénario: Mise à jour du contextes unset creation date KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_unset_creationdate.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400

  Scénario: Mise à jour du contextes unset identifier KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_unset_identifier.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400

  Scénario: Mise à jour du contextes set fake status KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_set_fake_status.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400

  Scénario: Mise à jour du contextes set fake attribute KO
    Etant donné un contexte nommé My_Context_i8
    Et un fichier requete nommé data/queries/update/ko/update_set_fake_attribute.json
    Alors je modifie le contexte nommé My_Context_i8 le statut de la requête est 400
