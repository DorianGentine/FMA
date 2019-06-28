class MatchSolution

  def initialize(form, solution)
    @formulaire = form
    @form = FormularyToHash.new(form).to_hash_forma
    @solution = solution
    @array_of_conditions = @solution.set_conditions
  end

  def call
    match_with_all_conditions
  end

  private

  def match_with_all_conditions
    is_a_match = []
    @array_of_conditions.each do |condition|
      matching = matching(condition).is_a?(Array) ? true : false
      is_a_match << matching
    end

    if is_a_match.include?(true)
      return true
    else
      return false
    end
  end


  def matching(condition)
    condition.keys.each do |key|
      value_to_check = @form[key]
      if key == 4
        value_to_check = his_age(value_to_check)
      elsif key == 10
        value_to_check = check_accommodation(value_to_check)
      elsif key == 17
        value_to_check = set_nbr_of_occupants(value_to_check)
      elsif key == 20 || key == 22 || key == 24
        value_to_check = set_tax_fiscal(@form, key)
      elsif key == 21 || key == 23
        value_to_check = set_tax_brut(@form, key)
      end
      break false unless check_verifaction(condition[key], value_to_check)
    end
  end


  def check_verifaction(value, form_value)
    # raise if value == [1, 2, 3] && form_value == 2
    if value.kind_of?(Array)
      return value.include?(form_value) ? true : false
    else
      return form_value == value ? true : false
    end
  end

  def check_accommodation(value)
    return value < 4 ? 0 : 1
  end

  def his_age(age)
    day = age.split("/")[0].to_i
    month = age.split("/")[1].to_i
    year = age.split("/")[2].to_i
    now = Time.now.utc.to_date
    his_age = now.year - year - ((now.month > month || (now.month == month && now.day >= day)) ? 0 : 1)
    set_age_group(his_age)
  end


  def set_age_group(his_age)
    return false if his_age.nil?
    if his_age < 55
      return 0
    elsif his_age.between?(56,60)
      return 1
    elsif his_age.between?(61,70)
      return 2
    elsif his_age > 70
      return 3
    end
  end

  def set_nbr_of_occupants(number)
    return false if number.nil?
    if number == 1
      return 0
    else
      return 1
    end
  end

  def set_tax_fiscal(form, key)
    range = RevenuAnalyze.new(@formulaire).analyze_for_fiscal_de_reference
    if form[key] < range[:a]
      return 0
    elsif form[key] > range[:b]
      return 2
    else
      return 1
    end
  end

  def set_tax_brut(form, key)
    # TODO en fonction réponse ADRIEN
    limit = RevenuAnalyze.new(@formulaire).analyze_brut_global
    result = form[key] / 12
    return result < limit[:a] ? 0 : 1
  end

end
