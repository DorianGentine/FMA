class MatchSolution

  def initialize(form, solution)
    @form = FormularyToHash.new(form).to_hash_forma
    @solution = solution
    @array_of_conditions = @solution.set_conditions
  end

  def call
    return match_with_all_conditions
  end

  private

  def match_with_all_conditions
    is_a_match = []
    @array_of_conditions.each do |condition|
      matching(condition).is_a?(Array) ? matching = true : matching = false
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
      end
      break false unless check_verifaction(condition[key], value_to_check)
    end
  end


  def check_verifaction(value, form_value)
    if value.kind_of?(Array)
      value.include?(form_value) ? true : false
    else
      form_value == value ? true : false
    end
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

end
