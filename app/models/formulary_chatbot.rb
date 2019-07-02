class FormularyChatbot

  def set_questions_form(chatbot)
      {
      "step_0" => step_0(chatbot).merge({id: 1}),
      "step_1" => step_1(chatbot).merge({id: 2}),
      "first_name" => first_name(chatbot).merge({id: 3}),
      "step_2" => step_2(chatbot).merge({id: 2}),
      "step_3" => step_3(chatbot).merge({id: 2}),
      "step_4" => step_4(chatbot).merge({id: 2}),
      "zip_code" => zip_code(chatbot).merge({id: 4}),
      "age" => age(chatbot).merge({id: 5}),
      "is_working" => is_working(chatbot).merge({id: 6}),
      "loss_of_autonomy_receipt" => loss_of_autonomy_receipt(chatbot).merge({id: 7}),
      "occupation" => occupation(chatbot).merge({id: 8}),
      "holder_occupation" => holder_occupation(chatbot).merge({id: 9}),
      "lessor" => lessor(chatbot).merge({id: 10}),
      "accommodation" => accommodation(chatbot).merge({id: 11}),
      "floor" => floor(chatbot).merge({id: 12}),
      "accessibility_with_step" => accessibility_with_step(chatbot).merge({id: 13}),
      "type_of_pension" => type_of_pension(chatbot).merge({id: 14}),
      "pension" => pension(chatbot).merge({id: 15}),
      "supplementary" => supplementary(chatbot).merge({id: 16}),
      "loss_of_autonomy" => loss_of_autonomy(chatbot).merge({id: 17}),
      "occupant" => occupant(chatbot).merge({id: 18}),
      "owner_is_include" => owner_is_include(chatbot).merge({id: 19}),
      "has_partner" => has_partner(chatbot).merge({id: 20}),
      "tax_revenue" => tax_revenue(chatbot).merge({id: 21}),
      "gross_income" => gross_income(chatbot).merge({id: 22}),
      "global_tax_revenue" => global_tax_revenue(chatbot).merge({id: 23}),
      "household_income" => household_income(chatbot).merge({id: 24}),
      "owner_tax_revenue" => owner_tax_revenue(chatbot).merge({id: 25}),
      "assistant" => assistant(chatbot).merge({id: 26}),
      "form_completed" => form_completed(chatbot).merge({id: 27})
    }
  end


  def step_0(chatbot)
    return {
      question: chatbot ? questions_chatbot[:step_0] : questions[:step_0],
      position: 0,
      need_answer: false
    }
  end

  def wrong_zip_code
    return {
      question: "Notre service n'est pas encore disponible dans votre Département. Nous y travaillons activement. A bientôt",
      position: 0,
      need_answer: false
    }
  end

  def step_1(chatbot)
    return {
      question: chatbot ? questions_chatbot[:step_1] : questions[:step_1],
      position: 0,
      need_answer: false
    }
  end

  def step_2(chatbot)
    return {
      question: chatbot ? questions_chatbot[:step_2] : questions[:step_2],
      position: 0,
      need_answer: false
    }
  end

  def step_3(chatbot)
    return {
      question: chatbot ? questions_chatbot[:step_3] : questions[:step_3],
      position: 0,
      need_answer: false
    }
  end
  def step_4(chatbot)
    return {
      question: chatbot ? questions_chatbot[:step_4] : questions[:step_4],
      position: 0,
      need_answer: false
    }
  end
  def form_completed(chatbot)
    return {
      question: chatbot ? questions_chatbot[:form_completed] : questions[:form_completed],
      position: 0,
      need_answer: false
    }
  end

  def first_name(chatbot)
    return {
      question: chatbot ? questions_chatbot[:first_name] : questions[:first_name],
      column_name: "first_name",
      type: "input",
      multiple_answers: false,
      hint: false,
      placeholder: "votre prénom",
      data: nil,
      need_answer: true,
      start_answer: "Bonjour Sam, je m'appelle",
      currency: nil,
      position: 2
    }
  end
  def zip_code(chatbot)
    return {
      question: chatbot ? questions_chatbot[:zip_code] : questions[:zip_code],
      column_name: "zip_code",
      type: "input",
      multiple_answers: false,
      hint: false,
      placeholder: "ex: 94000",
      data: nil,
      need_answer: true,
      errorLabel: "Inserer uniquement les 5 chiffres de votre code postal",
      start_answer: "Je réside à",
      currency: nil,
      position: 3
    }
  end

  def age(chatbot)
    return {
      question: chatbot ? questions_chatbot[:age] : questions[:age],
      column_name: "age",
      type: "input",
      multiple_answers: false,
      hint: false,
      placeholder: "dd/mm/aaaa",
      data: nil,
      need_answer: true,
      start_answer: "Ma date de naissance est le",
      currency: nil,
      position: 4
    }
  end
  def is_working(chatbot)
    return {
      question: chatbot ? questions_chatbot[:is_working] : questions[:is_working],
      column_name: "is_working",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "",
      data: FormularyChoice::YES_NO,
      need_answer: true,
      start_answer: {
        currency: nil,
        oui: "J'exerce une activité professionnelle.",
        non: "Je n'exerce pas d'activité professionnelle."
      },
      position: 5
    }
  end
  def loss_of_autonomy_receipt(chatbot)
    return {
      question: chatbot ? questions_chatbot[:loss_of_autonomy_receipt] : questions[:loss_of_autonomy_receipt],
      column_name: "loss_of_autonomy_receipt",
      type: "select",
      multiple_answers: false,
      hint: "Par exemple: un certificat médical",
      placeholder: "",
      data: FormularyChoice::YES_NO,
      need_answer: true,
      start_answer: {
        currency: nil,
        oui: "Oui, je dispose de ces justificatifs",
        non: "Non, je ne dispose d'aucun justificatif"
      },
      position: 6
    }
  end
  def occupation(chatbot)
    return {
      question: chatbot ? questions_chatbot[:occupation] : questions[:occupation],
      column_name: "occupation",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::OCCUPATION_CHOICES,
      need_answer: true,
      start_answer: "Je suis",
      currency: nil,
      position: 7
    }
  end
  def holder_occupation(chatbot)
    return {
      question: chatbot ? questions_chatbot[:holder_occupation] : questions[:holder_occupation],
      column_name: "holder_occupation",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::HOLDER_OCCUPATION_CHOICES,
      need_answer: true,
      start_answer: "Il est",
      currency: nil,
      position: 8
    }
  end
  def lessor(chatbot)
    return {
      question: chatbot ? questions_chatbot[:lessor] : questions[:lessor],
      column_name: "lessor",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: Acteur.list_of("BAILLEUR").map { |choice| choice.name  },
      need_answer: true,
      start_answer: "Il s'agit de",
      currency: nil,
      position: 9
    }
  end
  def accommodation(chatbot)
    return {
      question: chatbot ? questions_chatbot[:accommodation] : questions[:accommodation] ,
      column_name: "accommodation",
      type: "select",
      multiple_answers: false,
      hint: "La typologie dépend normalement du nombre de pièces à vivre (chambres, salon) composants le logement. Par exemple, un logement comportant une seule chambre et un salon est considéré comme un T2.
            Attention, parfois la lettre 'T' est remplacée par la lettre 'F' (F1, F2, F3, ...).
            En cas de doute, nous vous invitons à vérifier sur votre contrat de bail cette information",
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::ACCOMMODATION,
      need_answer: true,
      start_answer: "J'habite dans un logement de type",
      currency: nil,
      position: 10
    }
  end
  def floor(chatbot)
    return {
      question: chatbot ? questions_chatbot[:floor] : questions[:floor],
      column_name: "floor",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::FLOOR,
      need_answer: true,
      start_answer: "Je suis en",
      currency: nil,
      position: 11
    }
  end

  def accessibility_with_step(chatbot)
    return {
      question: chatbot ? questions_chatbot[:accessibility_with_step] : questions[:accessibility_with_step],
      column_name: "accessibility_with_step",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "",
      data: FormularyChoice::YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Elle est accessible",
        non: "Je dois franchir une ou plusieurs marche(s)"
      },
      position: 12
    }
  end

  def type_of_pension(chatbot)
    return {
      question: chatbot ? questions_chatbot[:type_of_pension] : questions[:type_of_pension],
      column_name: "type_of_pension",
      type: "select",
      multiple_answers: false,
      hint: "Une pension de réversion est versée à un conjoint survivant d'une personne décédée ayant elle-même perçue une pension de retraite à titre principal ou complémentaire",
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::TYPE_OF_PENSION,
      need_answer: true,
      start_answer: nil,
      currency: nil,
      position: 13
    }
  end

  def pension(chatbot)
    return {
      question: chatbot ? questions_chatbot[:pension] : questions[:pension],
      column_name: "pension",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: Acteur.list_of("CAISSE DE RETRAITE PRINCIPALE").map { |choice| choice.name  },
      need_answer: true,
      start_answer: "Il s'agit de l'organisme",
      currency: nil,
      position: 14
    }
  end
  def supplementary(chatbot)
    return {
      question: chatbot ? questions_chatbot[:supplementary] : questions[:supplementary],
      column_name: "supplementary",
      type: "select",
      multiple_answers: true,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: Acteur.list_of("CAISSE DE RETRAITE COMPLÉMENTAIRE").map { |choice| choice.name  },
      need_answer: true,
      start_answer: {
        one: "Il s'agit de l'organisme ",
        more: "Il s'agit des organismes "
      },
      currency: nil,
      position: 15
    }
  end
  def loss_of_autonomy(chatbot)
    return {
      question: chatbot ? questions_chatbot[:loss_of_autonomy] : questions[:loss_of_autonomy],
      column_name: "loss_of_autonomy",
      type: "select",
      multiple_answers: false,
      hint: "Le GIR correspond au niveau de perte d'autonomie d'une personne âgée. Il est calculé à partir de l'évaluation effectuée par un professionnel médico social. Il existe six GIR : le GIR 1 est le niveau de perte d'autonomie le plus fort et le GIR 6 le plus faible. Si vous détenez un GIR, il pourrait être noté sur une notification format papier, reçue par exemple de votre Conseil départemental ou d'une de vos caisses de retraites.",
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::LOSS_OF_AUTONOMY,
      need_answer: true,
      start_answer: "Mon GIR est",
      currency: nil,
      position: 16
    }
  end
  def occupant(chatbot)
    return {
      question: chatbot ? questions_chatbot[:occupant] : questions[:occupant] ,
      column_name: "occupant",
      type: "number",
      multiple_answers: false,
      hint: false,
      placeholder: "1 = juste vous",
      data: nil,
      need_answer: true,
      currency: nil,
      start_answer: {
        "1" => "J'habite seul.",
        "2" => "Nous sommes "
      },
      position: 17
    }
  end
  def owner_is_include(chatbot)
    return {
      question: chatbot ? questions_chatbot[:owner_is_include] : questions[:owner_is_include],
      column_name: "owner_is_include",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "",
      data: FormularyChoice::YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Oui, le propriétaire du logement y vit.",
        non: "Non, il n'y vit pas."
      },
      position: 18
    }
  end
  def has_partner(chatbot)
    return {
      question: chatbot ? questions_chatbot[:has_partner] : questions[:has_partner],
      column_name: "has_partner",
      type: "select",
      multiple_answers: false,
      hint: false,
      placeholder: "",
      data: FormularyChoice::YES_NO,
      need_answer: true,
      currency: nil,
      start_answer: {
        oui: "Je vis avec un conjoint, concubin ou partenaire de PACS.",
        non: "Je n'occupe pas maritalement mon logement."
      },
      position: 19
    }
  end
  def tax_revenue(chatbot)
    return {
      question: chatbot ? questions_chatbot[:tax_revenue] : questions[:tax_revenue],
      column_name: "tax_revenue",
      type: "number",
      multiple_answers: false,
      hint: "Le Revenu Fiscal de Référence (RFR) est le montant net de vos revenus et plus-values imposables, auquel s'ajoutent certains revenus exonérés et abattements. Il est calculé par l'administration fiscale et figure sur la première page de l'avis d'imposition.",
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Mon revenu fiscal de référence est de ",
      currency: true,
      position: 20
    }
  end
  def gross_income(chatbot)
    return {
      question: chatbot ? questions_chatbot[:gross_income] : questions[:gross_income],
      column_name: "gross_income",
      type: "number",
      multiple_answers: false,
      hint: "Le revenu brut représente l'ensemble des revenus perçus tout au long d'une année. Il figure sur la deuxième page de l'avis d'imposition.",
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Mon revenu brut global est de ",
      currency: true,
      position: 21
    }
  end
  def global_tax_revenue(chatbot)
    return {
      question: chatbot ? questions_chatbot[:global_tax_revenue] : questions[:global_tax_revenue],
      column_name: "global_tax_revenue",
      type: "number",
      multiple_answers: false,
      hint: "Le Revenu Fiscal de Référence (RFR) est le montant net de vos revenus et plus-values imposables, auquel s'ajoutent certains revenus exonérés et abattements. Il est calculé par l'administration fiscale et figure sur la première page de l'avis d'imposition.",
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Mon revenu fiscal de référence est de ",
      currency: true,
      position: 22
    }
  end
  def household_income(chatbot)
    return {
      question: chatbot ? questions_chatbot[:household_income] : questions[:household_income],
      column_name: "household_income",
      type: "number",
      multiple_answers: false,
      hint: "Le revenu brut représente l'ensemble des revenus perçus tout au long d'une année. Il figure sur la deuxième page de l'avis d'imposition.",
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Mon revenu brut global est de ",
      currency: true,
      position: 23
    }
  end
  def owner_tax_revenue(chatbot)
    return {
      question: chatbot ? questions_chatbot[:owner_tax_revenue] : questions[:owner_tax_revenue],
      column_name: "owner_tax_revenue",
      type: "number",
      multiple_answers: false,
      hint: "Le Revenu Fiscal de Référence (RFR) est le montant net de vos revenus et plus-values imposables, auquel s'ajoutent certains revenus exonérés et abattements. Il est calculé par l'administration fiscale et figure sur la première page de l'avis d'imposition.",
      placeholder: "Votre revenu en €",
      data: nil,
      need_answer: true,
      start_answer: "Mon revenu fiscal de référence est de ",
      currency: true,
      position: 24
    }
  end
  def assistant(chatbot)
    return {
      question: chatbot ? questions_chatbot[:assistant] : questions[:assistant],
      column_name: "assistant",
      type: "select",
      multiple_answers: true,
      hint: false,
      placeholder: "Choisir parmi la liste",
      data: FormularyChoice::ASSISTANT,
      need_answer: true,
      start_answer: {
        one: "J'ai perçu l'aide suivante :",
        more: "J'ai perçu les aides suivantes :",
        none: "Je n'ai perçu aucune aide ou action sociale."
      },
      currency: nil,
      position: 25
    }
  end

  def questions
      return {
        step_0: nil,
        step_1: nil,
        step_2: nil,
        step_3: nil,
        step_4: nil,
        form_completed: nil,
        # last_name: "Je me présente je m'appelle <strong>Sam</strong> et vous ?",
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
        tax_revenue: "Quel est le montant de votre Revenu en € Fiscal de Référence ?",
        gross_income: "Quel est le montant de votre Revenu en € Brut Global ?",
        global_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence de l'ensemble de votre foyer ?",
        household_income: "Quel est le montant du Revenu Brut Global de votre ménage (incluant votre conjoint, concubin ou partenaire de PACS) ?",
        owner_tax_revenue: "Quel est le montant du Revenu Fiscal de Référence du propriétaire de votre logement ?",
        assistant: "Avez-vous déjà perçu ou percevez-vous une de ses aides ou actions sociales ?",
      }
  end

  private

  def questions_chatbot
      return {
        step_0: "Bonjour...",
        step_1: "Vérifions si votre projet d'adaptation de logement serait </strong>éligible à des financements.</strong>",
        # last_name: "Je me présente je m'appelle <strong>Sam</strong> et vous ?",
        first_name: "Je me présente je m'appelle <strong>Sam</strong> et vous ?",
        step_2: "Je vous propose de me donner 5 à 10 minutes pour que je puisse comprendre votre situation.",
        step_3: "A tout moment, vous pourrez modifier vos réponses en cliquant sur l'icône  <strong><i class='fas fa-pencil-alt'></i></strong>  en bas à gauche de votre message.",
        step_4: "Des informations complémentaires vous seront parfois proposées si vous cliquez sur le symbôle  <strong> <i class='far fa-question-circle hintClick'></i></strong> .",
        zip_code: "Quel est le code postal de votre lieu de résidence s'il vous plait ?",
        age: "Quel est votre date de naissance ?",
        is_working: "Exercez vous une activité professionnelle ?",
        loss_of_autonomy_receipt: "Disposez-vous de justificatifs prouvant que votre perte d'autonomie est liée à un évènement <strong>antérieur</strong> à vos 60 ans ?",
        occupation: "Dans votre logement, vous êtes …",
        holder_occupation: "Le titulaire de votre lieu d'habitation est …",
        lessor: "Quel est le nom du bailleur de votre logement ?",
        accommodation: "Quel est la typologie de votre logement ?",
        floor: "Résidez-vous en rez de chaussée (RDC) ou en étage ?",
        accessibility_with_step: "La porte d'entrée de votre logement est-elle accessible sans que vous n'ayez de marche à franchir ?",
        type_of_pension: "Concernant votre pension de retraite ou de réversion …",
        pension: "Comment se nomme la caisse de retraite principale vous versant votre pension de retraite ou de réversion à titre principal ?",
        supplementary: "Comment se nomme(nt) la ou les caisse(s) de retraite(s) complémentaire(s) vous versant votre pension de retraite complémentaire ou de réversion ?",
        loss_of_autonomy: "A quel Groupe Iso-Ressource ou GIR appartenez-vous ?",
        occupant: "Combien de personne(s) réside(nt) au sein de votre foyer ?",
        owner_is_include: "Le propriétaire de votre logement y vit-il ?",
        has_partner: "Vivez-vous avec un conjoint, concubin ou partenaire de PACS ?",
        tax_revenue: "Quel est le montant <strong>annuel</strong> de votre Revenu Fiscal de Référence ?",
        gross_income: "Quel est le montant <strong>annuel</strong> de votre Revenu Brut Global ?",
        global_tax_revenue: "Quel est le montant <strong>annuel</strong> du Revenu Fiscal de Référence de l'ensemble de votre foyer ?",
        household_income: "Quel est le montant <strong>annuel</strong> de votre Revenu Brut Global (incluant votre conjoint, concubin ou partenaire de PACS) ?",
        owner_tax_revenue: "Quel est le montant <strong>annuel</strong> du Revenu Fiscal de Référence du propriétaire de votre logement ?",
        assistant: "Avez-vous déjà perçu ou percevez-vous une de ses aides ou actions sociales ?",
        form_completed: "Merci d'avoir rempli le formulaire, cliquez sur <strong>voir mon analyse</strong> pour avoir un aperçu de vos financeurs"
      }

  end

end
