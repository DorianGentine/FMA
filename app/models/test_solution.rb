class TestSolution

  def initialize(solution)
    @solution = solution
    @array_of_conditions = @solution.set_conditions
    @choices = FormularyChoice.new.set_collections_formulary
  end

  def test_solution_form
    form = Formulary.new()
    answers = []
    100.times do
      answers << create_formulary(form)
    end
    return answers.include?(true) ? true : answers.uniq
  end

  private


  def create_formulary(form)
    Formulary.column_names.each_with_index do |column_name, form_index|
      index = form_index - 2
      if skip_columns?(column_name)
        if column_name == "occupation" || column_name == "assistant" || column_name == "age"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", conditions.keys.include?(index) ? set_a_condition(index, conditions) : @choices[:"#{column_name}"].sample.second )
          end
        else
          @array_of_conditions.each do |conditions|
            if verify_condition(form, conditions, column_name, index) != false
              form.send("#{column_name}=", verify_condition(form, conditions, column_name, index) )
            else
              return "WRONG #{index}- #{column_name}"
            end
          end
        end
      end
    end
    return true
  end

  def skip_columns?(column_name)
    if column_name != "id" && column_name != "visitor_id" && column_name != "project_id" &&
      column_name != "created_at" && column_name != "updated_at" &&
      column_name != "last_name" && column_name != "first_name" && column_name != "zip_code"
      return true
    end
  end

  def verify_condition(form, conditions, attribute, index)
    allow = "allow_" + attribute + "?"
    if conditions.keys.include?(index) && form.send(allow)
     set_a_condition(index, conditions)
    else
      choice = @choices[:"#{attribute}"].sample
      (choice.is_a?(String) ? choice : choice.second) if form.send(allow)
      return false if conditions.keys.include?(index)
    end
  end

  def set_a_condition(index, conditions)
    conditions[index].is_a?(Array) ? conditions[index].sample : conditions[index]
  end

end
