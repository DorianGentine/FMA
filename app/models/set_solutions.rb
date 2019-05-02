class SetSolutions

  def initialize(form)
    @form = form
  end

  def call
    solutions = []
    Solution.all.each do |solution|
      if MatchSolution.new(@form, solution).call
        solutions << solution
      end
    end
    return solutions
  end

end
