class TestSolution

  def initialize(solution)
    @solution = solution
    @array_of_conditions = @solution.set_conditions
    @choices = FormularyChoice.new.set_collections_formulary
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
        elsif column_name == "tax_revenue" || column_name == "global_tax_revenue" || column_name == "owner_tax_revenue"
          @array_of_conditions.each do |conditions|
             form.send("#{column_name}=", rand(20000.. 26000) ) if form.occupant < 1
             form.send("#{column_name}=", rand(30000.. 39000) ) if form.occupant == 2
             form.send("#{column_name}=", rand(34000.. 45000) ) if form.occupant > 2
          end
        elsif column_name == "gross_income" || column_name == "household_income"
          @array_of_conditions.each do |conditions|
            form.send("#{column_name}=", rand(2000.. 2200) ) if form.has_partner != "1- Non"
            form.send("#{column_name}=", rand(1000.. 1600) ) if form.occupant == "1- Non"
          end
        else
          @array_of_conditions.each do |conditions|
            if verify_condition(form, conditions, column_name, index) != false
              form.send("#{column_name}=", verify_condition(form, conditions, column_name, index) )
            else
              return "#{@solution.id} WRONG #{index}- #{column_name}"
            end
          end
        end
      end
    end
    return true
  end

  def skip_column_to_verif?(column_name)
    if column_name != "id" && column_name != "visitor_id" && column_name != "project_id" &&
      column_name != "created_at" && column_name != "updated_at" && column_name != "old_zip_code" &&
      column_name != "first_name" && column_name != "zip_code" && column_name != "address" && column_name != "primary" && column_name != "latitude" && column_name != "longitude"
      return true
    end
  end

  def verify_condition(form, conditions, attribute, index)
    allow = "allow_" + attribute + "?"
    if conditions.keys.include?(index) && form.send(allow)
      return true
    else
      if conditions.keys.include?(index)
        return false
      else
        return nil
      end
    end
  end

  def verify_condition(form, conditions, attribute, index)
    # raise if attribute == "lessor" && conditions.keys.include?(index)
    allow = "allow_" + attribute + "?"
    if conditions.keys.include?(index) && form.send(allow)
      set_a_condition(index, conditions)
    else
      if conditions.keys.include?(index)
        return false
      elsif form.send(allow)
        choice = @choices[:"#{attribute}"].sample
        choice.is_a?(String) ? choice : choice.second
      else
        nil
      end
    end








    # if conditions.keys.include?(index) && form.send(allow)
    #  set_a_condition(index, conditions)
    # else
    #   choice = @choices[:"#{attribute}"].sample
    #   (choice.is_a?(String) ? choice : choice.second) if form.send(allow)
    #   return false if conditions.keys.include?(index)
    # end
  end

  def set_a_condition(index, conditions)
    conditions[index].is_a?(Array) ? conditions[index].sample : conditions[index]
  end

end
