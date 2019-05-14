class RevenuAnalyze

  def initialize(form)
    @form = form
  end

  def analyze_for_fiscal_de_reference
    revenu_fiscal_de_reference(@form.occupant)
  end

  def analyze_brut_global
    answer = @form.has_partner == "1- Non" ? false : true
    revenu_brut_global(answer)
  end

  private

  def revenu_fiscal_de_reference(nbr_occupants)
    if nbr_occupants == 1
      return { a: 20470, b: 24918 }
    elsif nbr_occupants == 2
      return { a: 30044, b: 36572 }
    elsif nbr_occupants == 3
      return { a: 36080, b: 43924 }
    elsif nbr_occupants == 4
      return { a: 42128, b: 51289 }
    elsif nbr_occupants == 5
      return { a: 48198, b: 58674 }
    elsif nbr_occupants > 5
      sup = nbr_occupants - 5
      return { a: 48198 + sup*6059, b: 58674 + sup*7377 }
    end
  end

  def revenu_brut_global(has_partner)
    if has_partner
      return [
        { a: 0, b: 1452, result: 0.65},
        { a: 1453, b: 1551, result: 0.59},
        { a: 1552, b: 1698, result: 0.55},
        { a: 1699, b: 1756, result: 0.50},
        { a: 1757, b: 1820, result: 0.43},
        { a: 1821, b: 1923, result: 0.37},
        { a: 1924, b: 2136, result: 0.30},
        { a: 2137, b: 100000, result: 0},
      ]
    else
      return [
        { a: 0, b: 836, result: 0.65},
        { a: 837, b: 895, result: 0.59},
        { a: 896, b: 1010, result: 0.55},
        { a: 1011, b: 1091, result: 0.50},
        { a: 1092, b: 1141, result: 0.43},
        { a: 1142, b: 1259, result: 0.37},
        { a: 1260, b: 1424, result: 0.30},
        { a: 1425, b: 100000, result: 0},
      ]
    end
  end

end
