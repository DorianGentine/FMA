class Formulary < ApplicationRecord
  belongs_to :visitor
  belongs_to :project

  LESSOR_NAMES = ["BATIGERE", "CDC HABITAT", "COOPERER POUR HABITER", "DOMNIS", "FRANCE HABITATION", "FOYER SOLEIL", "I3F", "ICADE IPM",
  "ICADE IPM", "IN'LI QWACIO", "KREMLIN BICETRE HABITAT", "LA SEMISE", "LOGIAS", "LOGIAL OPH",
  "MAISONS ALFORT HABITAT", "NOVIGERE", "OPALY", "OPH GENTILLY", "OPH L'HAY LES ROSES", "OPH VILLEJUIF", "OPH VITRY", "OPH IVRY",
  "OSICA", "RATP HABITAT", "RESIDENCE LE LOGEMENT DES FONCTIONNAIRES", "SIEMP", "VALOPHIS", "Autre" ]

  SUPPLEMENTARY_NAMES = [ "Aucune caisse de retraite complémentaire ne me verse de pension de retraite complémentaire ou de reversion",
  "AG2R", "B2V", "HUMANIS", "IRCANTEC", "KLESIA", "MALAKOFFF MEDERIC", "PROBTP", "AUDIENS", "IRP AUTO", "LOURMEL", "Autre : Libre"]

  AGE = {
    0 => "Strictement inférieur à 55 ans",
    1 => "De 56 à 60 ans",
    2 => "De 61 à 75 ans",
    3 => "Strictement supérieur à 75 ans"
  }

  OCCUPATION_CHOICES = {
    0 => "Propriétaire occupant",
    1 => "Occupant à titre gratuit",
    2 => "Locataire du parc social",
    3 => "Locataire du parc privé",
    4 => "Hébergé en famille d'accueil"
  }

  HOLDER_OCCUPATION_CHOICES = {
    0 => "Propriétaire occupant",
    1 => "Locataire du parc social",
    2 => "Locataire du parc privé"
  }
  ACCOMMODATION = {
    0 => "T1, T2 ou T3",
    1 => "Strictement supérieur au T3"
  }

  FLOOR = {
    0 => "Étage",
    1 => "Rez de chaussée"
  }

  TYPE_OF_PENSION = {
    0 => "Je perçois à titre principal une pension de retraite ou de réversion de la CNAV",
    1 => "Je perçois à titre principal une pension de retraite ou de réversion d'un autre organisme que la CNAV",
    2 => "Je ne perçois aucune pension de retraite ou de réversion à titre principal"
  }

  LOSS_OF_AUTONOMY = {
    0 => "Strictement supérieur à 4",
    1 => "Inférieur ou égale à 4",
    2 => "J'ai disposé d'une évaluation de mon GIR mais je ne le connais plus",
    3 => "Je ne dispose d'aucun GIR"
  }

  OCCUPANT = {
    0 => "J'habite seul",
    1 => "Au moins 1 autre personne compose mon foyer"
  }

  TAXE_REVENUE = {
    0 => "Strictement inférieur à A",
    1 => "Entre A et B",
    2 => "Supérieur ou égal à B"
  }

  GROSS_INCOME = {
    0 => "Strictement inférieur à A",
    1 => "Supérieur ou égal à A"
  }

  GLOBAL_TAXE_REVENUE = {
    0 => "Strictement inférieur à A",
    1 => "Entre A et B",
    2 => "Supérieur ou égal à B"
  }

  HOUSEHOLD_INCOME = {
    0 => "Strictement inférieur à A",
    1 => "Supérieur ou égal à A"
  }

  OWNER_TAXE_REVENUE = {
    0 => "Strictement inférieur à A",
    1 => "Entre A et B",
    2 => "Supérieur ou égal à B"
  }

  ASSISTANT = {
    0 => "Prêt à taux 0 au cours des 5 dernières années",
    1 => "Aide pour l'adaptation du logement via l'APA",
    2 => "PCH",
    3 => "Dispositif d'action social auprès d'une caisse de retraite principale",
    4 => "Subvention de l'ANAH au cours des 5 dernières années",
    5 => "Non"
  }

  # enum age: [ "Strictement inférieur à 55 ans", "De 56 à 60 ans", "De 61 à 75 ans", "Strictement supérieur à 75 ans" ]
  # enum occupation: [ "Propriétaire occupant", "Occupant à titre gratuit", "Locataire du parc social", "Locataire du parc privé", "Hébergé en famille d'accueil" ], _suffix: true
  # enum holder_occupation: [ "Propriétaire occupant", "Locataire de parc social", "Locataire du parc privé" ]
  # enum accommodation: [ "T1, T2 ou T3", "Strictement supérieur au T3" ]
  # enum floor: [ "Étage", "Rez de chaussée" ]
  # enum type_of_pension: ["Je perçois à titre principal une pension de retraite ou de réversion de la CNAV", "Je perçois à titre principal une pension de retraite ou de réversion d'un autre organisme que la CNAV", "Je ne perçois aucune pension de retraite ou de réversion à titre principal" ]
  # enum loss_of_autonomy: ["Strictement supérieur à 4", "Inférieur ou égale à 4", "J'ai disposé d'une évaluation de mon GIR mais je ne le connais plus", "Je ne dispose d'aucun GIR" ]
  # enum occupant: ["J'habite seul", "Au moins 1 autre personne compose mon foyer" ]
  # enum tax_revenue: [ "Strictement inférieur à A", "Entre A et B", "Supérieur ou égal à B" ], _suffix: true
  # enum gross_income: [ "Strictement inférieur à A", "Supérieur ou égal à A" ], _prefix: :gross_income
  # enum global_tax_revenue: [ "Strictement inférieur à A", "Entre A et B", "Supérieur ou égal à B" ]
  # enum household_income: [ "Strictement inférieur à A", "Supérieur ou égal à A" ], _prefix: :household_income
  # enum owner_tax_revenue: [ "Strictement inférieur à A", "Entre A et B", "Supérieur ou égal à B" ], _prefix: :owner_tax_revenue
  # enum assistant: [" Prêt à taux 0 au cours des 5 dernières années", " Aide pour l'adaptation du logement via l'APA", " PCH", "Dispositif d'action social auprès d'une caisse de retraite principale", " Subvention de l'ANAH au cours des 5 dernières années", "Non" ]

  YES_NO = {
    0 => "Oui",
    1 => "Non"
  }

  # enum is_working: [ "oui", "non"]
  # enum loss_of_autonomy_receipt: [ "file", "no_file"]
  # enum accessibility_with_step: [ "no_step", "with_step"]
  # enum owner_is_include: [ "include", "no_include"]
  # enum has_partner: [ "yes", "no"]


end
