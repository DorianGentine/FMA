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
    is_working: YES_NO.map { |choice, index| [index, choice]  },
    loss_of_autonomy_receipt: YES_NO.map { |choice, index| [index, choice]  },
    accessibility_with_step: YES_NO.map { |choice, index| [index, choice]  },
    owner_is_include: YES_NO.map { |choice, index| [index, choice]  },
    has_partner: YES_NO.map { |choice, index| [index, choice]  },
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



  def last_name
    return {
      question: questions[:last_name],
      column_name: "last_name",
      type: "input",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: nil,
      tooltip: nil,
      errorLabel: nil,
      position: 1,
      validate: {
        required: true
      }
    }
  end
  def first_name
    return {
      question: questions[:first_name],
      column_name: "first_name",
      type: "input",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: nil,
      tooltip: nil,
      errorLabel: nil,
      position: 2,
      validate: {
        required: true
      }
    }
  end
  def zip_code
    return {
      question: questions[:zip_code],
      column_name: "zip_code",
      type: "input",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: nil,
      tooltip: nil,
      errorLabel: nil,
      position: 3,
      validate: {
        required: true
      }
    }
  end
  def age
    return {
      question: questions[:age],
      column_name: "age",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: AGE,
      tooltip: nil,
      errorLabel: nil,
      position: 4,
      validate: {
        required: true
      }
    }
  end

  def is_working
    return {
      question: questions[:is_working],
      column_name: "is_working",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: YES_NO,
      tooltip: nil,
      errorLabel: nil,
      position: 5,
      validate: {
        required: true
      }
    }
  end
  def loss_of_autonomy_receipt
    return {
      question: questions[:loss_of_autonomy_receipt],
      column_name: "loss_of_autonomy_receipt",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: YES_NO,
      tooltip: nil,
      errorLabel: nil,
      position: 6,
      validate: {
        required: true
      }
    }
  end
  def occupation
    return {
      question: questions[:occupation],
      column_name: "occupation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: OCCUPATION_CHOICES,
      tooltip: nil,
      errorLabel: nil,
      position: 7,
      validate: {
        required: true
      }
    }
  end
  def holder_occupation
    return {
      question: questions[:holder_occupation],
      column_name: "holder_occupation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: HOLDER_OCCUPATION_CHOICES,
      tooltip: nil,
      errorLabel: nil,
      position: 8,
      validate: {
        required: true
      }
    }
  end
  def lessor
    return {
      question: questions[:lessor],
      column_name: "lessor",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: LESSOR_NAMES,
      tooltip: nil,
      errorLabel: nil,
      position: 9,
      validate: {
        required: true
      }
    }
  end

  def accommodation
    return {
      question: questions[:accommodation],
      column_name: "accommodation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: ACCOMMODATION,
      tooltip: nil,
      errorLabel: nil,
      position: 10,
      validate: {
        required: true
      }
    }
  end

  def floor
    return {
      question: questions[:floor],
      column_name: "floor",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: FLOOR,
      tooltip: nil,
      errorLabel: nil,
      position: 11,
      validate: {
        required: true
      }
    }
  end

  def accessibility_with_step
    return {
      question: questions[:accessibility_with_step],
      column_name: "accessibility_with_step",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: YES_NO,
      tooltip: nil,
      errorLabel: nil,
      position: 12,
      validate: {
        required: true
      }
    }
  end

  def type_of_pension
    return {
      question: questions[:type_of_pension],
      column_name: "type_of_pension",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: TYPE_OF_PENSION,
      tooltip: nil,
      errorLabel: nil,
      position: 13,
      validate: {
        required: true
      }
    }
  end
  def pension
    return {
      question: questions[:pension],
      column_name: "pension",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: PENSION_NAMES,
      tooltip: nil,
      errorLabel: nil,
      position: 14,
      validate: {
        required: true
      }
    }
  end
  def supplementary
    return {
      question: questions[:supplementary],
      column_name: "supplementary",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: SUPPLEMENTARY_NAMES,
      tooltip: nil,
      errorLabel: nil,
      position: 15,
      validate: {
        required: true
      }
    }
  end
  def loss_of_autonomy
    return {
      question: questions[:loss_of_autonomy],
      column_name: "loss_of_autonomy",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: LOSS_OF_AUTONOMY,
      tooltip: nil,
      errorLabel: nil,
      position: 16,
      validate: {
        required: true
      }
    }
  end
  def occupant
    return {
      question: questions[:occupant],
      column_name: "occupant",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: OCCUPANT,
      tooltip: nil,
      errorLabel: nil,
      position: 17,
      validate: {
        required: true
      }
    }
  end
  def owner_is_include
    return {
      question: questions[:owner_is_include],
      column_name: "owner_is_include",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: YES_NO,
      tooltip: nil,
      errorLabel: nil,
      position: 18,
      validate: {
        required: true
      }
    }
  end
  def has_partner
    return {
      question: questions[:has_partner],
      column_name: "has_partner",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: YES_NO,
      tooltip: nil,
      errorLabel: nil,
      position: 19,
      validate: {
        required: true
      }
    }
  end
  def tax_revenue
    return {
      question: questions[:tax_revenue],
      column_name: "tax_revenue",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: TAXE_REVENUE,
      tooltip: nil,
      errorLabel: nil,
      position: 20,
      validate: {
        required: true
      }
    }
  end
  def gross_income
    return {
      question: questions[:gross_income],
      column_name: "gross_income",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: GROSS_INCOME,
      tooltip: nil,
      errorLabel: nil,
      position: 21,
      validate: {
        required: true
      }
    }
  end
  def global_tax_revenue
    return {
      question: questions[:global_tax_revenue],
      column_name: "global_tax_revenue",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: GLOBAL_TAXE_REVENUE,
      tooltip: nil,
      errorLabel: nil,
      position: 22,
      validate: {
        required: true
      }
    }
  end
  def household_income
    return {
      question: questions[:household_income],
      column_name: "household_income",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: HOUSEHOLD_INCOME,
      tooltip: nil,
      errorLabel: nil,
      position: 23,
      validate: {
        required: true
      }
    }
  end
  def owner_tax_revenue
    return {
      question: questions[:owner_tax_revenue],
      column_name: "owner_tax_revenue",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: OWNER_TAXE_REVENUE,
      tooltip: nil,
      errorLabel: nil,
      position: 24,
      validate: {
        required: true
      }
    }
  end
  def assistant
    return {
      question: questions[:assistant],
      column_name: "assistant",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisir quelques",
      data: ASSISTANT,
      tooltip: nil,
      errorLabel: nil,
      position: 25,
      validate: {
        required: true
      }
    }
  end

  private

  def questions
    {
      last_name: "Quel est votre nom ?",
      first_name: "Quel est votre prénom ?",
      zip_code: "Quel est le code postal de votre ville de résidence ?",
      age: "Quel est votre date de naissance ?",
      is_working: "Exercez-vous une activité professionnelle ?",
      loss_of_autonomy_receipt: "Disposez-vous de justificatifs prouvant que votre perte d'autonomie est liée à un évènement antérieur à la date d'anniversaire de vos 60 ans ?",
      occupation: "Quel est votre statut d'occupation dans votre logement ?",
      holder_occupation: "Quel est le statut d'occupation du titulaire de votre logement ?",
      lessor: "Quel est le nom du bailleur de votre logement ?",
      accommodation: "Quel est la typologie de votre logement ?",
      floor: "Résidez vous en rez de chaussée ou en étage ?",
      accessibility_with_step: "La porte d'entrée de votre logement est-elle accessible sans que vous n'ayez de marche à franchir ?",
      type_of_pension: "Concernant votre pension de retraite ou de réversion ?",
      pension: "Comment se nomme la caisse de retraite principale vous versant votre pension de retraite ou de réversion à titre principal ?",
      supplementary: "Comment se nomme(nt) la ou les caisse(s) de retraite(s) complémentaire(s) vous versant votre pension de retraite complémentaire ou de réversion ?",
      loss_of_autonomy: "A quel Groupe Iso-Ressource ou GIR appartenez-vous ?",
      occupant: "Combien de personne(s) réside(nt) au sein de votre foyer ?",
      owner_is_include: "Le propriétaire de votre logement y vit-il ?",
      has_partner: "Vivez-vous avec un conjoint, concubin ou partenaire de PACS ?",
      tax_revenue: "Quel est le montant de votre Revenu Fiscal de Référence ?",
      gross_income: "Quel est le montant de votre Revenu Brut Global ?",
      global_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence de l'ensemble de votre foyer ?",
      household_income: "Quel est le montant du Revenu Brut Global de votre ménage (incluant votre conjoint, concubin ou partenaire de PACS) ?",
      owner_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence du propriétaire de votre logement ?",
      assistant: "Avez-vous déjà perçu ou percevez-vous une de ses aides ou actions sociales ?",
    }
  end

end
