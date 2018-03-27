############
VITAM Itests
############


.. section-numbering::

.. image:: logo_vitam.png
        :alt: Logo Vitam (Bêta)
        :align: center

Le projet Vitam Itests
======================

Il a pour objectif :

* de permettre la définition de fichiers feature décrivant une série de scénarios de tests regroupés par fonctionnalités.
* l'aggrégation de fichiers de tests (dans le répertoire data) : contrats, référentiels de formats, requêtes DSL, rêgles de gestions, et différents SIP.

A la racine du projet, on trouvera donc les différents fichiers .feature permettant de lancer les différents cas de test.
Dans le répertoire data, seront regroupés les différents fichiers nécéssaires aux différents scénarios décrits dans les fichiers .feature.

Liste des fichiers feature
==========================

 - access-accession-register.feature : 
Regroupe des scénarios de test sur les recherches dans les registres de fonds.

 - access-archive-unit.feature : 
Regroupe des scénarios de test sur les recherches d'unités archivistiques.

 - access-archive-unit-rule-heritance.feature : 
Regroupe des scénarios de test concernant l'héritage de règles de gestion pour les unités archivistiques.

 - access-archive-unit-rules-calculation.feature : 
Regroupe des scénarios de test concernant le calcul de règles de gestion.

 - access-archive-unit-update.feature :
Regroupe des scénarios de test sur la mise à jour d'unités archivistiques.

 - access-logbook.feature :
Regroupe des scénarios de test sur la recherche dans le journal des opérations.

 - contracts.feature :
Regroupe des scénarios de test sur les contrats (d'accès et d'entrée) - import et recherche.

 - ingest.feature :
Regroupe des scénarios de test sur des entrées de SIP (OK, KO ou en WARNING).

 - ingest_atr.feature :
Regroupe des scénarios de test sur la récupération d'un ATR.

 - ingest-tree-filing-plan.feature :
Regroupe des scénarios de test sur des entrées d'arbres et de plans de classement.

 - referential.feature :
Regroupe des scénarios de test sur les différents référentiels (de formats, des règles de gestion), en import comme en recherche.

 - storage.feature :
Regroupe des scénarios de test sur la vérification du stockage des objets sur les différentes offres de stockage.

 - traceability.feature :
Regroupe des scénarios de test sur la fonctionnalité de sécurisation du journal des opérations.

 - security_profiles.feature :
Regroupe des scénarios de test sur les profiles de sécurité.


Fichiers de configuration pour lancement en local
=================================================

Pour pouvoir lancer depuis un poste local les différents fichiers features, il convient d'avoir une configuration. 
Dans le répertoire /data/conf, se trouvent les différents fichiers nécéssaires.

 - access-external-client.conf : fichier de configuration permettant l'appel vers le module Access External  
 - ingest-external-client.conf : fichier de configuration permettant l'appel vers le module Ingest External
 - logback.xml : fichier de configuration des logs
 - logbook-client.conf : fichier de configuration permettant d'appeler directement le module Logbook Internal
 - tnr.conf : fichier de configuration permettant de configurer l'url du Workspace ainsi que la liste des tenants de test à purger.
 
 
Lancement en local (Eclipse)
============================

Pour pouvoir lancer les TNR en local, il faut disposer des sources VITAM et notamment du module functional-test.
Ensuite il s'agit d'ajouter une nouvelle configuration de lancement (Run Configuration) et d'y indiquer les informations suivantes : 
Dans Main :
 - Project : functional-test
 - Main class : cucumber.api.cli.Main
Dans Arguments :
 - Program arguments : -g fr.gouv.vitam.functionaltest.cucumber -p fr.gouv.vitam.functionaltest.cucumber.report.VitamReporter:report.json
 - Program arguments bis (pour ne lancer qu'un fichier feature) : -g fr.gouv.vitam.functionaltest.cucumber -p fr.gouv.vitam.functionaltest.cucumber.report.VitamReporter:report.json /home/vitam/vitam-itests/contracts.feature
 - VM arguments : -DtnrBaseDirectory=/home/vitam/vitam-itests
Dans Classpath : Dans les Advanced Options > Add External Folders > Séléctionner l'endroit de sa configuration locale (ex : /home/vitam/conf-tnr/)

