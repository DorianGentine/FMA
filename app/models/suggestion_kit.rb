class SuggestionKit

  def initialize(project)
    @project = project
    @solution_ids = @project.solutions.map { |s| s.id }
    @financers_name = SetSolutions.new.financers(@project)
    @acteurs_name = SetSolutions.new.acteurs(@project)
  end

  def call
    # J'ai besoin: Solutions / Nom des Financeurs / Nom des Acteurs
    Ressource.all.each do |suggestion|
      if is_a_match?(suggestion)
        kit = Kit.create(project: @project, ressource: suggestion )
      end
    end
  end

  private

  def is_a_match?(suggestion)
    solutions = []
    if suggestion[:solution_ids].present?
      sugg = suggestion[:solution_ids].split(",").map { |s| s.to_i }
      @solution_ids.each do |solution_id|
        solutions << "ok" if sugg.include?(solution_id)
      end
      solution = solutions.uniq.to_s
      solution = "not" if solutions.blank?
    end
    if suggestion[:acteur].present?
      financer = @financers_name.include?(suggestion[:financer]) ? "ok" : "not"
    end
    if suggestion[:acteur].present?
      acteur = @acteurs_name.include?(suggestion[:acteur]) ? "ok" : "not"
    end
    if solution == "not" || financer == "not" || acteur == "not"
      return false
    else
      return true
    end
  end

  # def suggestions
  #   return [{
  #     solution_ids: [2,5,8,12,16,19,22,26],
  #     ressource: Ressource.find(1)
  #   },
  #   {
  #     financer: "CREDIT D'IMPOT",
  #     ressource: Ressource.find(7)
  #   },
  #   {
  #     solution_ids: [44,45,46,47,48],
  #     acteur: "CAMIEG",
  #     ressource: Ressource.find(10)
  #   }]
  # end
end
