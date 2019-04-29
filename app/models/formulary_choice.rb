class FormularyChoice


  LESSOR_NAMES = ["BATIGERE", "CDC HABITAT", "COOPERER POUR HABITER", "DOMNIS", "FRANCE HABITATION", "FOYER SOLEIL", "I3F", "ICADE IPM",
  "ICADE IPM", "IN'LI QWACIO", "KREMLIN BICETRE HABITAT", "LA SEMISE", "LOGIAS", "LOGIAL OPH",
  "MAISONS ALFORT HABITAT", "NOVIGERE", "OPALY", "OPH GENTILLY", "OPH L'HAY LES ROSES", "OPH VILLEJUIF", "OPH VITRY", "OPH IVRY",
  "OSICA", "RATP HABITAT", "RESIDENCE LE LOGEMENT DES FONCTIONNAIRES", "SIEMP", "VALOPHIS", "Autre" ]

  PENSION_NAMES = [ "CAMIEG", "CNRACL", "RSI", "CARCDSF", "Autre"]

  SUPPLEMENTARY_NAMES = [ "Aucune caisse de retraite complémentaire ne me verse de pension de retraite complémentaire ou de reversion",
  "AG2R", "B2V", "HUMANIS", "IRCANTEC", "KLESIA", "MALAKOFFF MEDERIC", "PROBTP", "AUDIENS", "IRP AUTO", "LOURMEL", "Autre : Libre"]

  AGE = {
    0 => "0- Strictement inférieur à 55 ans",
    1 => "1- De 56 à 60 ans",
    2 => "2- De 61 à 75 ans",
    3 => "3- Strictement supérieur à 75 ans"
  }

  OCCUPATION_CHOICES = {
    0 => "0- Propriétaire occupant",
    1 => "1- Occupant à titre gratuit",
    2 => "2- Locataire du parc social",
    3 => "3- Locataire du parc privé",
    4 => "4- Hébergé en famille d'accueil"
  }

  HOLDER_OCCUPATION_CHOICES = {
    0 => "0- Propriétaire occupant",
    1 => "1- Locataire du parc social",
    2 => "2- Locataire du parc privé"
  }
  ACCOMMODATION = {
    0 => "0- T1, T2 ou T3",
    1 => "1- Strictement supérieur au T3"
  }

  FLOOR = {
    0 => "0- Étage",
    1 => "1- Rez de chaussée"
  }

  TYPE_OF_PENSION = {
    0 => "0- Je perçois à titre principal une pension de retraite ou de réversion de la CNAV",
    1 => "1- Je perçois à titre principal une pension de retraite ou de réversion d'un autre organisme que la CNAV",
    2 => "2- Je ne perçois aucune pension de retraite ou de réversion à titre principal"
  }

  LOSS_OF_AUTONOMY = {
    0 => "0- Strictement supérieur à 4",
    1 => "1- Inférieur ou égale à 4",
    2 => "2- J'ai disposé d'une évaluation de mon GIR mais je ne le connais plus",
    3 => "3- Je ne dispose d'aucun GIR"
  }

  OCCUPANT = {
    0 => "0- J'habite seul",
    1 => "1- Au moins 1 autre personne compose mon foyer"
  }

  TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  GROSS_INCOME = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Supérieur ou égal à A"
  }

  GLOBAL_TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  HOUSEHOLD_INCOME = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Supérieur ou égal à A"
  }

  OWNER_TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  ASSISTANT = {
    0 => "0- Prêt à taux 0 au cours des 5 dernières années",
    1 => "1- Aide pour l'adaptation du logement via l'APA",
    2 => "2- PCH",
    3 => "3- Dispositif d'action social auprès d'une caisse de retraite principale",
    4 => "4- Subvention de l'ANAH au cours des 5 dernières années",
    5 => "5- Non"
  }

  YES_NO = {
    0 => "0- Oui",
    1 => "1- Non"
  }


  def set_collections_formulary
    {
    lessor: LESSOR_NAMES,
    supplementary: SUPPLEMENTARY_NAMES,
    pension: PENSION_NAMES,
    yes_no: YES_NO.map { |choice, index| [index, choice]  },
    age: AGE.map { |choice, index| [index, choice]  },
    occupation: OCCUPATION_CHOICES.map { |choice, index| [index, choice]  },
    holder_occupation: HOLDER_OCCUPATION_CHOICES.map { |choice, index| [index, choice]  },
    accommodation: ACCOMMODATION.map { |choice, index| [index, choice]  },
    floor: FLOOR.map { |choice, index| [index, choice]  },
    type_of_pension: TYPE_OF_PENSION.map { |choice, index| [index, choice]  },
    loss_of_autonomy: LOSS_OF_AUTONOMY.map { |choice, index| [index, choice]  },
    occupant: OCCUPANT.map { |choice, index| [index, choice]  },
    tax_revenue: TAXE_REVENUE.map { |choice, index| [index, choice]  },
    gross_income: GROSS_INCOME.map { |choice, index| [index, choice]  },
    global_tax_revenue: GLOBAL_TAXE_REVENUE.map { |choice, index| [index, choice]  },
    household_income: HOUSEHOLD_INCOME.map { |choice, index| [index, choice]  },
    owner_tax_revenue: OWNER_TAXE_REVENUE.map { |choice, index| [index, choice]  },
    assistant: ASSISTANT.map { |choice, index| [index, choice]  }
    }
  end


end
