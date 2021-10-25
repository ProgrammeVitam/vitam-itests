# language: fr

@Access
@AccessionRegisterDetails
Fonctionnalité: Recherche des détails de registres des fonds

  Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés et je charge un contrat d'accès
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  @Light
  Scénario: Test requête par DSL des détails de registre de fonds
    Etant donné les tests effectués sur le tenant 0
    Et un fichier SIP nommé data/SIP_OK/ZIP/NEW_3_UNITS_2_GOTS.zip
    Quand je télécharge le SIP
    Et j'utilise le fichier de requête suivant data/queries/select_accession_register_details_by_dsl_query.json
    Et je recherche les détails des registres de fonds
    Alors le nombre de détails du registre de fond est 1
    Et les metadonnées pour le détail du registre de fond sont
      | OriginatingAgency           | FRAN_NP_009913 |
      | SubmissionAgency            | FRAN_NP_009913 |
      | TotalObjects.ingested       | 2 |
      | TotalObjectGroups.ingested  | 2 |
      | TotalUnits.ingested         | 3 |
      | ArchivalAgreement           | ArchivalAgreement0 |
      | Status                      | STORED_AND_COMPLETED |
      | Comment.array[]             | ["2eme SIP"] |
      | obIdIn                      | SIP passant contenant 2 groupes d'objets |
