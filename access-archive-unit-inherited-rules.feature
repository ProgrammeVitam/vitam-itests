# language: fr

@AccessArchiveUnitRuleCalculationComplete
Fonctionnalité: Calcul des règles de gestion sur jeu de test complexe complet

Contexte: Avant de lancer cette suite de test, je présuppose que les règles de gestions et de formats sont chargés.
    Etant donné les tests effectués sur le tenant 0
    Et un contract nommé data/contracts/contract_acces_TNR.json
    Et j'importe ce contrat sans échec de type ACCESS_CONTRACTS
    Et un contract nommé data/contracts/referential_contracts_ok.json
    Et j'importe ce contrat sans échec de type INGEST_CONTRACTS

  Scénario: Recherche une archive unit avec les règles héritées (1_Saint Denis Université (ligne 13))
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_EXTRA_COMPLEX.zip
    Quand j'utilise la requête suivante
"""
{"$roots": [],
  "$query": [{"$and":[{"$eq":{"Title":"1_Saint Denis Université (ligne 13)"}},{"$in":{"#operations":["Operation-Id"]}}]}],
  "$projection": {}}
"""
    Et je recherche les unités archivistiques avec leurs règles de gestion héritées
    Quand je sélectionne la catégorie StorageRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 0 règles et 1 propriétés héritées
    Et la catégorie contient une propriété FinalAction héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
	| PropertyValue         | Copy                                              |
	| OriginatingAgency     | RATP                                              |
	| Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |

    Quand je sélectionne la catégorie AccessRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 1 règles et 0 propriétés héritées
    Et la catégorie contient une règle ACC-00002 héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
	| StartDate             | "2000-01-01"                                      |
	| EndDate               | "2025-01-01"                                      |
	| Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |

    Quand je sélectionne la catégorie AppraisalRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 0 règles et 1 propriétés héritées
    Et la catégorie contient une propriété FinalAction héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
	| PropertyValue         | Keep                                              |
	| OriginatingAgency     | RATP                                              |
	| Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |

    Quand je sélectionne la catégorie ClassificationRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 1 règles et 5 propriétés héritées
    Et la catégorie contient une propriété ClassificationLevel héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
	| PropertyValue         | Confidentiel D\u00E9fense                         |
	| OriginatingAgency     | RATP                                              |
	| Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |
	Et la catégorie contient une propriété ClassificationOwner héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
    | PropertyValue         | ClassificationOwner0                              |
    | OriginatingAgency     | RATP                                              |
    | Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |
    Et la catégorie contient une propriété ClassificationAudience héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
    | PropertyValue         | ClassificationAudience0                           |
    | OriginatingAgency     | RATP                                              |
    | Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |
    Et la catégorie contient une propriété NeedReassessingAuthorization héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
    | PropertyValue         | true                                              |
    | OriginatingAgency     | RATP                                              |
    | Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |
    Et la catégorie contient une propriété ClassificationReassessingDate héritée depuis l'unité 1_Saint Denis Université (ligne 13) avec pour métadonnées
    | PropertyValue         | 2016-06-03                                        |
    | OriginatingAgency     | RATP                                              |
    | Paths.array[][]       | [["{{unit:1_Saint Denis Université (ligne 13)}}"]]           |

    Quand je sélectionne la catégorie DisseminationRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 0 règles et 0 propriétés héritées

    Quand je sélectionne la catégorie ReuseRule pour l'unité 1_Saint Denis Université (ligne 13)
    Alors la catégorie contient 0 règles et 0 propriétés héritées

Scénario: Recherche plusieurs archive units avec les règles héritées
    Etant donné les données du jeu de test du SIP nommé data/SIP_OK/ZIP/OK_RULES_EXTRA_COMPLEX.zip
    Quand j'utilise la requête suivante
"""
{"$roots": [],
  "$query": [{"$in":{"#operations":["Operation-Id"]}}],
  "$projection": {}}
"""
    Et je recherche les unités archivistiques avec leurs règles de gestion héritées
    Alors les règles hérités de l'unité 1_Saint Denis Université (ligne 13) correspondent au fichier json inheritedRules/SaintDenisUniversite.json
    Alors les règles hérités de l'unité 4_ Porte de Clignancourt (ligne 4) correspondent au fichier json inheritedRules/PorteDeClignancourt.json
    Alors les règles hérités de l'unité Porte de la Chapelle correspondent au fichier json inheritedRules/PorteDeLaChapelle.json
    Alors les règles hérités de l'unité Saint-Lazare correspondent au fichier json inheritedRules/SaintLazare.json
    Alors les règles hérités de l'unité Gare du Nord correspondent au fichier json inheritedRules/GareDuNord.json
    Alors les règles hérités de l'unité Réaumur correspondent au fichier json inheritedRules/Reaumur.json
    Alors les règles hérités de l'unité Bolivar.txt correspondent au fichier json inheritedRules/Bolivar.json
    Alors les règles hérités de l'unité Eglise de Pantin correspondent au fichier json inheritedRules/EgliseDePantin.json
    Alors les règles hérités de l'unité Père Lachaise correspondent au fichier json inheritedRules/PereLachaise.json
    Alors les règles hérités de l'unité Marx Dormoy correspondent au fichier json inheritedRules/MarxDormoy.json
    Alors les règles hérités de l'unité République correspondent au fichier json inheritedRules/Republique.json
    Alors les règles hérités de l'unité Botzaris correspondent au fichier json inheritedRules/Botzaris.json
    Alors les règles hérités de l'unité Carrefour Pleyel correspondent au fichier json inheritedRules/CarrefourPleyel.json
    Alors les règles hérités de l'unité Place des Fêtes correspondent au fichier json inheritedRules/PlaceDesFetes.json
    Alors les règles hérités de l'unité 6_Pré Saint Gervais (ligne 3 bis) correspondent au fichier json inheritedRules/PreSaintGervais.json
    Alors les règles hérités de l'unité 5_Bobigny (ligne 5) correspondent au fichier json inheritedRules/Bobigny.json
    Alors les règles hérités de l'unité 3_Gallieni (ligne 3) correspondent au fichier json inheritedRules/Gallieni.json
    Alors les règles hérités de l'unité Danube correspondent au fichier json inheritedRules/Danube.json
    Alors les règles hérités de l'unité Gambetta correspondent au fichier json inheritedRules/Gambetta.json
    Alors les règles hérités de l'unité Montparnasse.txt correspondent au fichier json inheritedRules/Montparnasse.json
    Alors les règles hérités de l'unité Château Rouge correspondent au fichier json inheritedRules/ChateauRouge.json
    Alors les règles hérités de l'unité Stalingrad.txt correspondent au fichier json inheritedRules/Stalingrad.json
    Alors les règles hérités de l'unité 2_Front Populaire (ligne 12) correspondent au fichier json inheritedRules/FrontPopulaire.json
    Alors les règles hérités de l'unité Porte de Pantin correspondent au fichier json inheritedRules/PorteDePantin.json
    Alors les règles hérités de l'unité Pereire.txt correspondent au fichier json inheritedRules/Pereire.json
    Alors les règles hérités de l'unité Buttes-Chaumont correspondent au fichier json inheritedRules/ButtesChaumont.json
    Alors les règles hérités de l'unité Simplon correspondent au fichier json inheritedRules/Simplon.json
    Alors les règles hérités de l'unité Saint Denis Basilique correspondent au fichier json inheritedRules/SaintDenisBasilique.json
