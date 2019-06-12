class SetSolutions

  def call(form)
    solutions = []
    Solution.all.each do |solution|
      if form.is_finish? && MatchSolution.new(form, solution).call
        solutions << solution
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
            solutions << solution
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
end
