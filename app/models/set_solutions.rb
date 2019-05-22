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
end
