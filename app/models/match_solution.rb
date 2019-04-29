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
# raise if @solution.id == 39
    end
    if is_a_match.include?(true)
      return true
    else
      return false
    end
  end


  def matching(condition)
    condition.keys.each do |key|
      break false unless check_verifaction(condition[key], @form[key])
    end
  end


  def check_verifaction(value, form_value)
    if value.kind_of?(Array)
      value.include?(form_value) ? true : false
    else
      form_value == value ? true : false
    end
  end

end
