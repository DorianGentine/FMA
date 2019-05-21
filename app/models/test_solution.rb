class TestSolution

  def initialize(solution)
    @solution = solution
    @array_of_conditions = @solution.set_conditions
    @choices = FormularyChatbot.new.set_collections_formulary
  end

  def test_solution_form
    answers = []
    100.times do
      answers << create_formulary
    end
    return answers.include?(true) ? true : answers.uniq
  end

  private


  def create_formulary
    form = Formulary.new()

    Formulary.column_names.each_with_index do |column_name, form_index|
      index = form_index - 1
      if skip_column_to_verif?(column_name)
        if column_name == "occupation"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", conditions.keys.include?(index) ? set_a_condition(index, conditions) : @choices[:"#{column_name}"].sample.second )
          end
        elsif column_name == "assistant"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", conditions.keys.include?(index) ? set_a_condition(index, conditions) : @choices[:"#{column_name}"][rand(@choices[:"#{column_name}"].count)] )
          end
        elsif column_name == "age"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", @choices[:test_age].sample.first )
          end
        elsif column_name == "occupant"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", rand(1..3) )
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

  def skip_column_to_verif?(column_name)
    if column_name != "id" && column_name != "visitor_id" && column_name != "project_id" &&
      column_name != "created_at" && column_name != "updated_at" &&
      column_name != "first_name" && column_name != "zip_code" && column_name != "primary"
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
