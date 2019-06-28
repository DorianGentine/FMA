class SetSolutions

  def call(form)
    solutions = []
    Solution.all.each do |solution|
      if form.is_finish? && MatchSolution.new(form, solution).call
        solution_set = change_XXX_for(solution, form)
        solutions << solution_set
      end
    end
    return solutions
  end

  def call_for(project)
    forms = Formulary.where(project: project)
    solutions = []
    forms.each do |form|
      Solution.all.each do |solution|
        if form.is_finish? && MatchSolution.new(form, solution).call
          if solutions.exclude?(solution)
            solution_set = change_XXX_for(solution, form)
            solutions << solution_set
          end
        end
      end
    end
    return solutions
  end

  def financers(project)
    solutions = call_for(project)
    financers = solutions.map { |s| s.financer.name }
    return financers.uniq
  end

  def acteurs(project)
    forms = Formulary.where(project: project)
    acteurs =  []
    forms.each do |form|
      if form.lessor.present?
        acteurs << form.lessor
      elsif form.pension.present?
        acteurs << form.pension
      elsif form.supplementary.present?
        acteurs << form.supplementary
      end
    end
    return acteurs.uniq
  end

  private

  def change_XXX_for(solution, form)
    if solution.financer.name == "ANAH"
      range = RevenuAnalyze.new(form).analyze_for_fiscal_de_reference
      solution.answers.map do |answer|
         answer.content = answer.content.split("XXX et XXX").join("#{range[:a]}€ et #{range[:b]}€")
      end
      return solution
    elsif solution.financer.name == "CNAV"
      range = RevenuAnalyze.new(form).hash_revenu_brut_global
      selected = []
      range.each do |e|
        revenu = form.gross_income.nil? ? form.household_income / 12 : form.gross_income / 12
        if revenu.between?(e[:a], e[:b])
          selected << e
        end
      end
      selected = selected.first
      solution.answers.map do |answer|
         answer.content = answer.content.split("XXX %").join("#{selected[:result] * 100} %")
         answer.content = answer.content.split("de XXX euros").join("de #{selected[:max]} euros")
         answer.content = answer.content.split("XXX et XXX").join("#{selected[:a]} et #{selected[:b]}€")
         first = answer.content.split("atteindre XXX euros").first(2).join("atteindre #{selected[:result] * 1000 > selected[:max] ? selected[:max]: selected[:result] * 1000} euros")
         last = "atteindre #{selected[:result] * 30000 > selected[:max] ? selected[:max]: selected[:result] * 30000} euros" + answer.content.split("atteindre XXX euros").last

         answer.content = first + last
      end
      return solution
    elsif solution.financer.name == "CAISSE DE RETRAITE PRINCIPALE"
      solution.answers.map do |answer|
         answer.content = answer.content.split("XXX").join("#{form.pension.nil? ? "CNAV" : form.pension }")
      end
      return solution
    elsif solution.financer.name == "CAISSE DE RETRAITE COMPLÉMENTAIRE"
      solution.answers.map do |answer|
         answer.content = answer.content.split("XXX").join("#{form.supplementary}")
      end
      return solution
    else
      return solution
    end
  end
end
















