#language: fr

@massUpdateMdgAupControl
Fonctionnalité: Mise à jour en masse des métadonnées de gestion avec vérification par rapport au profil d'unité archivistique (AUP)



    Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions , formats et contrat d'accès sont chargés
        Etant donné les tests effectués sur le tenant 0
        #Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_Caracteres_Asiatiques.zip


    Scénario: Ajouter à des AU un AUP (profil d'unité archivistique) actif et contenant un schéma de contrôle – OK
        Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse.zip
        Et un document type nommé data/archiveUnitProfiles/aup_ok_notice_mail_schema_masseUpdate.json
        Et je fais un import du document type
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_mdg_au_aup_ok.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est OK

    Scénario: Modifier un AUP associé à des AU par un profil d'unité archivistique actif et avec schéma de contrôle – OK
        Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse.zip
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdg_au_aup_ok.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est OK

    Scénario: Supprimer un AUP associé à des AU – OK
        Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/delete_mdg_au_aup_ok.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est OK

    Scénario: Modifier un AUP associé à des AU alors que le contrat d'accès utilisé n'a pas les droits d'écriture sur les métadonnées de gestion
        Et J'utilise le contrat d'access OnlyDescUpdateAllowed
        Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse.zip
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_aup_onlyDesUpdateAlloweddContrat_ko
        Alors les metadonnées sont
              | Code           | 401   |

     Scénario: Ajouter / Modifier une AU avec un AUP qui n'existe pas dans le référentiel – KO
        Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse.zip
        Quand j'utilise le fichier de requête suivant data/queries/mass-update/add_unknownAUP.json
        Et je lance la mise à jour de masse des règles de gestion
        Alors le statut final du journal des opérations est KO


    Scénario:  Modifier le profil d'unité archivistique des unités archivistiques par un profil d'unité archivistique alors que certaines des unités archivistiques sont non conformes à ce profil d'unité archivistique - Warning
      Et les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_Caracteres_Asiatiques.zip
      Et les données du jeu de test du SIP nommé data/SIP_WARNING/ZIP/WARNING_SIP_maj_masse.zip
      Etant donné un document type nommé data/archiveUnitProfiles/aup_ok_masseupdate_schema_masseUpdatejson
      Et je fais un import du document type
      Quand j'utilise le fichier de requête suivant data/queries/mass-update/update_mdg_au_nonConforme_aup_ko.json
      Et je lance la mise à jour de masse des règles de gestion
      Alors le statut final du journal des opérations est WARNING
