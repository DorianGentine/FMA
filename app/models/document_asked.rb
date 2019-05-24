class DocumentAsked

  def initialize(project)
    @project = project
    @solutions = @project.solutions
    @formularies = @project.formularies
  end

  def call
    if scan_each_conditions != false
      if !Document.where(project: @project, title: type_document_1[:title]).present?
        Document.create(project: @project, title: type_document_1[:title], description: type_document_1[:description], notice: type_document_1[:notice], solution_ids: scan_each_conditions)
      end
    end
  end

  private

  def scan_each_conditions
    array_solution_id = []
    type_document_1[:conditions].each do |condition|
      if scan_document_by_solution(condition) != false
        scan_document_by_solution(condition).each { |e| array_solution_id << e }
      end
      if scan_document_by_answer(condition) != false
        scan_document_by_answer(condition).each { |e| array_solution_id << e }
      end
    end
    return array_solution_id.nil? ? false : array_solution_id
  end

  def scan_document_by_solution(condition)
    return false if condition[:condition_solutions].nil?
    solution_ids_needed = condition[:condition_solutions].split(",").map{ |e| e.to_i}
    solution_ids_selected = @solutions.map { |e| e.id  }
    array_solution_id = []
    solution_ids_needed.each do |solution_id|
      if solution_ids_selected.include?(solution_id)
        array_solution_id << solution_id
      end
    end
    if array_solution_id.nil?
      return false
    else
      return array_solution_id
    end
  end

  def scan_document_by_answer(condition)
    return false if condition[:condition_answers].nil?
    condition_needed = set_condition(condition[:condition_answers])
    @formularies.each do |form|
      json_form = FormularyToHash.new(form).to_hash_forma
      condition_needed.each do |key, value|
        if json_form[key] == value
          return true
        end
      end
    end
    return false
  end

  def type_document_1
    {
      title: "Avis situation déclarative impot revenu",
      description: "Dernier avis de situation déclarative à l'impôt sur le revenu de votre foyer",
      notice: "https://res.cloudinary.com/financermonautonomie/image/upload/v1558508261/exemple_documents_a_demander/Avis_situation_declarative_impot_revenu_dfgfoq.pdf",
      conditions: [
        {
         condition_solutions: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28",
         condition_answers: nil,
        },
        {
         condition_solutions: "61",
         condition_answers: "16:[IRCANTEC,  AG2R, IRP AUTO, HUMANIS]",
        },
        {
         condition_solutions: nil,
         condition_answers: "15:[CAMIEG]",
        }
      ]
    }
  end

  def set_condition(conditions)
    array_conditions = conditions.split(",").map {|e| e.split(":")}
    new_condition = {}
    array_conditions.each do |condition|
      value = condition.second
      set_value = value.to_i.to_s == value ? value.to_i : value
      new_condition[condition.first.to_i] = set_value
    end
    return new_condition
  end
end
