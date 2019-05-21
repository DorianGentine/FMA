class SetSolutions

  def call(form)
    solutions = []
    Solution.all.each do |solution|
      if MatchSolution.new(form, solution).call
        solutions << solution
      end
    end
    return solutions
  end

  def call_for(project)
    form = Formulary.where(project: project).first
    solutions = []
    Solution.all.each do |solution|
      if MatchSolution.new(form, solution).call
        solutions << solution
      end
    end
    return solutions
  end
end
