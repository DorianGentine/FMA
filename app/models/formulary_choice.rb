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

  TEST_AGE = {
    0 => "12/21/1978",
    1 => "12/21/1960",
    2 => "12/21/1950",
    3 => "12/21/1940"
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

  ASSISTANT = [ "0- un prêt à taux 0 au cours des 5 dernières années", "1- une aide pour l'adaptation du logement via l'APA", "2- un PCH", "3- un dispositif d'action social auprès d'une caisse de retraite principale", "4- une subvention de l'ANAH au cours des 5 dernières années", "5- Rien" ]

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
    test_age: TEST_AGE.map { |choice, index| [index, choice]  },
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
    assistant: ASSISTANT
    }
  end

  def set_questions_form
      {
      "step_0" => step_0,
      "step_1" => step_1,
      "first_name" => first_name,
      "zip_code" => zip_code,
      "age" => age,
      "is_working" => is_working,
      "loss_of_autonomy_receipt" => loss_of_autonomy_receipt,
      "occupation" => occupation,
      "holder_occupation" => holder_occupation,
      "lessor" => lessor,
      "accommodation" => accommodation,
      "floor" => floor,
      "accessibility_with_step" => accessibility_with_step,
      "type_of_pension" => type_of_pension,
      "pension" => pension,
      "supplementary" => supplementary,
      "loss_of_autonomy" => loss_of_autonomy,
      "occupant" => occupant,
      "owner_is_include" => owner_is_include,
      "has_partner" => has_partner,
      "tax_revenue" => tax_revenue,
      "gross_income" => gross_income,
      "global_tax_revenue" => global_tax_revenue,
      "household_income" => household_income,
      "owner_tax_revenue" => owner_tax_revenue,
      "assistant" => assistant,
      "form_completed" => form_completed
    }
  end

  def step_0
    return {
      question: questions[:step_0],
      position: 0,
      need_answer: false
    }
  end

  def wrong_zip_code
    return {
      question: "Nous sommes désolé mais nous ne prenons pas encore votre département",
      position: 0,
      need_answer: false
    }
  end

  def step_1
    return {
      question: questions[:step_1],
      position: 0,
      need_answer: false
    }
  end

  def form_completed
    return {
      question: "Merci d'avoir rempli le formulaire, cliquez sur <strong>voir mon analyse</strong> pour avoir un aperçu de vos financeurs",
      position: 0,
      need_answer: false
    }
  end

  def first_name
    return {
      question: questions[:first_name],
      column_name: "first_name",
      type: "input",
      multiple_answers: false,
      placeholder: "votre prénom",
      data: nil,
      need_answer: true,
      start_answer: "Bonjour Sam, je m'appelle",
      currency: nil,
      position: 2
    }
  end
  def zip_code
    return {
      question: questions[:zip_code],
      column_name: "zip_code",
      type: "input",
      multiple_answers: false,
      placeholder: "ex: 94000",
      data: nil,
      need_answer: true,
      errorLabel: "Inserer uniquement les 5 chiffres de votre code postal",
      start_answer: "Je réside dans le",
      currency: nil,
      position: 3
    }
  end
  def age
    return {
      question: questions[:age],
      column_name: "age",
      type: "input",
      multiple_answers: false,
      placeholder: "dd/mm/aaaa",
      data: nil,
      need_answer: true,
      start_answer: "Ma date de naissance est le",
      currency: nil,
      position: 4
    }
  end
  def is_working
    return {
      question: questions[:is_working],
      column_name: "is_working",
      type: "select",
      multiple_answers: false,
      placeholder: "",
      data: YES_NO,
      need_answer: true,
      start_answer: {
        currency: nil,
        oui: "Oui, j'excerce une activité professionnelle",
        non: "Non, je n'excerce pas d'activité professionnelle"
      },
      position: 5
    }
  end
  def loss_of_autonomy_receipt
    return {
      question: questions[:loss_of_autonomy_receipt],
      column_name: "loss_of_autonomy_receipt",
      type: "select",
      multiple_answers: false,
      placeholder: "",
      data: YES_NO,
      need_answer: true,
      start_answer: {
        currency: nil,
        oui: "Oui, je dispose ces justificatifs",
        non: "Non, je ne dispose pas ces justificatifs"
      },
      position: 6
    }
  end
  def occupation
    return {
      question: questions[:occupation],
      column_name: "occupation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: OCCUPATION_CHOICES,
      need_answer: true,
      start_answer: "Je suis",
      currency: nil,
      position: 7
    }
  end
  def holder_occupation
    return {
      question: questions[:holder_occupation],
      column_name: "holder_occupation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: HOLDER_OCCUPATION_CHOICES,
      need_answer: true,
      start_answer: "Il est",
      currency: nil,
      position: 8
    }
  end
  def lessor
    return {
      question: questions[:lessor],
      column_name: "lessor",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: LESSOR_NAMES,
      need_answer: true,
      start_answer: "Il s'agit de",
      currency: nil,
      position: 9
    }
  end
  def accommodation
    return {
      question: questions[:accommodation],
      column_name: "accommodation",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: ACCOMMODATION,
      need_answer: true,
      start_answer: "Il s'agit d'un",
      currency: nil,
      position: 10
    }
  end
  def floor
    return {
      question: questions[:floor],
      column_name: "floor",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: FLOOR,
      need_answer: true,
      start_answer: "Je réside",
      currency: nil,
      position: 11
    }
  end
  def accessibility_with_step
    return {
      question: questions[:accessibility_with_step],
      column_name: "accessibility_with_step",
      type: "select",
      multiple_answers: false,
      placeholder: "",
      data: YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Oui, elle est accessible",
        non: "Non, je dois franchir une marche"
      },
      position: 12
    }
  end
  def type_of_pension
    return {
      question: questions[:type_of_pension],
      column_name: "type_of_pension",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: TYPE_OF_PENSION,
      need_answer: true,
      start_answer: nil,
      currency: nil,
      position: 13
    }
  end
  def pension
    return {
      question: questions[:pension],
      column_name: "pension",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: PENSION_NAMES,
      need_answer: true,
      start_answer: "Il s'agit de l'organisme",
      currency: nil,
      position: 14
    }
  end
  def supplementary
    return {
      question: questions[:supplementary],
      column_name: "supplementary",
      type: "select",
      multiple_answers: true,
      placeholder: "Choisi parmis la liste",
      data: SUPPLEMENTARY_NAMES,
      need_answer: true,
      start_answer: "Il s'agit de l'organisme",
      currency: nil,
      position: 15
    }
  end
  def loss_of_autonomy
    return {
      question: questions[:loss_of_autonomy],
      column_name: "loss_of_autonomy",
      type: "select",
      multiple_answers: false,
      placeholder: "Choisi parmis la liste",
      data: LOSS_OF_AUTONOMY,
      need_answer: true,
      start_answer: "j'appartiens",
      currency: nil,
      position: 16
    }
  end
  def occupant
    return {
      question: questions[:occupant],
      column_name: "occupant",
      type: "number",
      multiple_answers: false,
      placeholder: "1 = juste vous",
      data: nil,
      need_answer: true,
      currency: nil,
      start_answer: {
        "1" => "J'habite seul",
        "2" => "Nous sommes "
      },
      position: 17
    }
  end
  def owner_is_include
    return {
      question: questions[:owner_is_include],
      column_name: "owner_is_include",
      type: "select",
      multiple_answers: false,
      placeholder: "",
      data: YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Oui, le propriétaire vit dans le logement",
        non: "Non, le propriétaire ne vit pas dans le logement"
      },
      position: 18
    }
  end
  def has_partner
    return {
      question: questions[:has_partner],
      column_name: "has_partner",
      type: "select",
      multiple_answers: false,
      placeholder: "",
      data: YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Oui, je vis en couple",
        non: "Non, je ne vis pas en couple"
      },
      position: 19
    }
  end
  def tax_revenue
    return {
      question: questions[:tax_revenue],
      column_name: "tax_revenue",
      type: "number",
      multiple_answers: false,
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Le montant de mon revenu fiscal est de ",
      currency: true,
      position: 20
    }
  end
  def gross_income
    return {
      question: questions[:gross_income],
      column_name: "gross_income",
      type: "number",
      multiple_answers: false,
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Le montant de mon revenu brut global est de ",
      currency: true,
      position: 21
    }
  end
  def global_tax_revenue
    return {
      question: questions[:global_tax_revenue],
      column_name: "global_tax_revenue",
      type: "number",
      multiple_answers: false,
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Le montant de mon revenu fiscal de référence de l'ensemble de mon foyer est de ",
      currency: true,
      position: 22
    }
  end
  def household_income
    return {
      question: questions[:household_income],
      column_name: "household_income",
      type: "number",
      multiple_answers: false,
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Le montant de mon revenu brut global de votre ménage est de ",
      currency: true,
      position: 23
    }
  end
  def owner_tax_revenue
    return {
      question: questions[:owner_tax_revenue],
      column_name: "owner_tax_revenue",
      type: "number",
      multiple_answers: false,
      placeholder: "Votre revenu en €",
      data: OWNER_TAXE_REVENUE,
      need_answer: true,
      start_answer: "Le montant de mon revenu fiscal du propriétaire est de ",
      currency: true,
      position: 24
    }
  end
  def assistant
    return {
      question: questions[:assistant],
      column_name: "assistant",
      type: "select",
      multiple_answers: true,
      placeholder: "Choisi parmis la liste",
      data: ASSISTANT,
      need_answer: true,
      start_answer: "Je perçois",
      currency: nil,
      position: 25
    }
  end

  private

  def questions
    {
      step_0: "Bonjour...",
      step_1: "Vérifions si votre projet d'adaptation de <strong>logement est éligible</strong> à des fincancements.",
      # last_name: "Je me présente je m'appelle <strong>Sam</strong> et vous ?",
      first_name: "Je me présente je m'appelle <strong>Sam</strong> et vous ?",
      zip_code: "Quel est le code postal de votre ville de résidence ?",
      age: "Parfait, quel est votre date de naissance ?",
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
      tax_revenue: "Quel est le montant de votre Revenu en € Fiscal de Référence ?",
      gross_income: "Quel est le montant de votre Revenu en € Brut Global ?",
      global_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence de l'ensemble de votre foyer ?",
      household_income: "Quel est le montant du Revenu Brut Global de votre ménage (incluant votre conjoint, concubin ou partenaire de PACS) ?",
      owner_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence du propriétaire de votre logement ?",
      assistant: "Avez-vous déjà perçu ou percevez-vous une de ses aides ou actions sociales ?",
    }
  end

end

