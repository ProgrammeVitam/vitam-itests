# language: fr

@Ingest
Fonctionnalité: uploader des fichier SIP
  Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.

  Contexte:
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS


  Scénario: Test virus
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_VIRUS_code2.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le journal ne contient pas de statut FATAL
    Et le journal des opérations est cohérent
    Et le statut de l'événement SANITY_CHECK_SIP est KO
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO

  Scénario: Test ATR OK
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_SIP_2_GO.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Et le journal des opérations est cohérent
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 7 unités archivistiques
    Et le fichier ATR contient 4 objets binaires
    Et le fichier ATR contient 4 fois la valeur BinaryMaster
    Et le fichier ATR contient la valeur <ArchivalAgency><Identifier>Identifier4</Identifier></ArchivalAgency>
  
  Scénario: Test ATR OK with physical
    Etant donné un fichier SIP nommé data/SIP_OK/ZIP/OK_ArchivesPhysiques.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est OK
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est OK
    Et le fichier ATR contient 1 unité archivistique
    Et le fichier ATR contient 1 objet binaire
    Et le fichier ATR contient 1 objet physique
    Et le fichier ATR contient la valeur <ArchivalAgreement>ArchivalAgreement0</ArchivalAgreement>

  Scénario: Test ATR KO
    Etant donné un fichier SIP nommé data/SIP_KO/ZIP/KO_CYCLE.zip
    Quand je télécharge le SIP
    Et je recherche le journal des opérations
    Alors le statut final du journal des opérations est KO
    Et le journal ne contient pas de statut FATAL
    Et le journal des opérations est cohérent
    Quand je télécharge son fichier ATR
    Alors l'état final du fichier ATR est KO
    Et le fichier ATR contient 3 balises de type Event
    Et le fichier ATR contient les valeurs STP_INGEST_CONTROL_SIP.KO, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST_LOOP.KO, CHECK_DATAOBJECTPACKAGE.CHECK_MANIFEST.CHECK_MANIFEST_LOOP.KO
    Et le fichier ATR contient la  chaîne de caractères
"""
"evDetTechData":"Cycle : [ID24, ID22, ID20, ID18, ID16, ID14, ID12, ID10, ID8, ID6, ID24]"
"""
