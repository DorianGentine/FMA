class FormularyChoice

  AGE = {
    0 => "Strictement inférieur à 55 ans",
    1 => "De 56 à 60 ans",
    2 => "De 61 à 75 ans",
    3 => "Strictement supérieur à 75 ans"
  }

  TEST_AGE = {
    0 => "12/12/1978",
    1 => "12/12/1960",
    2 => "12/12/1950",
    3 => "12/12/1940"
  }
  TEST_TAXE = {
    0 => 1234,
    1 => 2076,
    2 => 890,
    3 => 3009
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
    0 => "T1",
    1 => "T2",
    2 => "T3",
    3 => "> T3"
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
    0 => "Supérieur à 4",
    1 => "Inférieur ou égale à 4",
    2 => "Je ne connais plus mon GIR",
    3 => "Je ne dispose pas de GIR"
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

  ASSISTANT = [
    "Prêt à taux 0 (PTZ) au cours des 5 dernière années",
    "Aide pour l'adaptation du logement via l'Allocation Personnalisé à l'Autonomie (APA)",
    "Prestation de Compensation du Handicap (PCH)",
    "Aide d'une caisse de retraite principale",
    "Subvention de l'Agence Nationale de l'Amélioration de l'Habitat (ANAH) au cours des 5 dernière années",
    "Non"
  ]

  YES_NO = {
    0 => "Oui",
    1 => "Non"
  }


  def set_collections_formulary
    {
      age: AGE.map { |choice, index| [index, choice]  },
      test_age: TEST_AGE.map { |choice, index| [index, choice]  },
      is_working: YES_NO.map { |choice, index| [index, choice]  },
      loss_of_autonomy_receipt: YES_NO.map { |choice, index| [index, choice]  },
      occupation: OCCUPATION_CHOICES.map { |choice, index| [index, choice]  },
      holder_occupation: HOLDER_OCCUPATION_CHOICES.map { |choice, index| [index, choice]  },
      lessor: Acteur.list_of("BAILLEUR").map { |choice| choice.name  },
      accommodation: ACCOMMODATION.map { |choice, index| [index, choice]  },
      floor: FLOOR.map { |choice, index| [index, choice]  },
      accessibility_with_step: YES_NO.map { |choice, index| [index, choice]  },
      type_of_pension: TYPE_OF_PENSION.map { |choice, index| [index, choice]  },
      pension: Acteur.list_of("CAISSE DE RETRAITE PRINCIPALE").map { |choice| choice.name  },
      supplementary: Acteur.list_of("CAISSE DE RETRAITE COMPLÉMENTAIRE").map { |choice| choice.name  },
      loss_of_autonomy: LOSS_OF_AUTONOMY.map { |choice, index| [index, choice]  },
      occupant: OCCUPANT.map { |choice, index| [index, choice]  },
      owner_is_include: YES_NO.map { |choice, index| [index, choice]  },
      has_partner: YES_NO.map { |choice, index| [index, choice]  },
      test_taxe: TEST_TAXE.map { |choice, index| [index, choice]  },
      tax_revenue: TAXE_REVENUE.map { |choice, index| [index, choice]  },
      gross_income: GROSS_INCOME.map { |choice, index| [index, choice]  },
      global_tax_revenue: GLOBAL_TAXE_REVENUE.map { |choice, index| [index, choice]  },
      household_income: HOUSEHOLD_INCOME.map { |choice, index| [index, choice]  },
      owner_tax_revenue: OWNER_TAXE_REVENUE.map { |choice, index| [index, choice]  },
      assistant: ASSISTANT
    }
  end
end

