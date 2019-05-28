class DocumentAsked

  def initialize(project)
    @project = project
    @solutions = @project.solutions
    @formularies = @project.formularies
  end

  def call
    @project.documents.destroy_all
    documents.each do |document|

      if scan_each_conditions(document) != false
        if Document.where(project: @project, description: document[:description]).count < 1
          Document.create(project: @project, title: document[:title], description: document[:description], notice: document[:notice], solution_ids: scan_each_conditions(document))
        end
      end
    end
  end

  private

  def documents
    return [ type_document_1, type_document_2, type_document_3, type_document_4]
  end

  def scan_each_conditions(type_document)
    array_solution_id = []
    type_document[:conditions].each do |condition|
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
         condition_answers: "16:[IRCANTEC,AG2R,IRP AUTO,HUMANIS]",
        },
        {
         condition_solutions: "44,45,46,47,48",
         condition_answers: "14:[CIPAV,CAMIEG,CARCDSF,CNRACL,RSI,CNAV]",
        }
      ]
    }
  end

  def type_document_2
    {
      title: "Avis situation déclarative impot revenu",
      description: "Dernier avis de situation déclarative à l'impôt sur le revenu du propriétaire du logement",
      notice: "https://res.cloudinary.com/financermonautonomie/image/upload/v1558508261/exemple_documents_a_demander/Avis_situation_declarative_impot_revenu_dfgfoq.pdf",
      conditions: [
        {
         condition_solutions: "3,6,9,10,13,14,17,20,23,24,27,28",
         condition_answers: nil,
        }
      ]
    }
  end

  def type_document_3
    {
      title: "Taxes foncieres",
      description: "Dernier avis de taxe foncière",
      notice: "https://res.cloudinary.com/financermonautonomie/image/upload/v1558508262/exemple_documents_a_demander/Taxes_foncieres_riykb9.pdf",
      conditions: [
        {
         condition_solutions: "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28",
         condition_answers: nil,
        }
      ]
    }
  end

  def type_document_4
    {
      title: "Decision president conseil departemental",
      description: "Justificatif de la perte d'autonomie",
      notice: "https://res.cloudinary.com/financermonautonomie/image/upload/v1558508261/exemple_documents_a_demander/Decision_president_conseil_departemental_zvnwo6.pdf",
      conditions: [
        {
         condition_solutions: "1,4,7,11,15,18,21,25,60,3,6,9,10,13,14,17,20,23,24,27,28",
         condition_answers: nil,
        },
        {
         condition_solutions: nil,
         condition_answers: "7:3,9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FOYER SOLEIL,FRANCE HABITATION,LA SEMISE,OPH L'HAY LES ROSES,LOGIAL OPH,MAISONS ALFORT HABITAT,OPALY,OPH IVRY,OPH VILLEJUIF,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP, CRETEIL HABITAT,I3F,INLI QWACIO]",
        },
        {
         condition_solutions: "61",
         condition_answers: "16:[AG2R,IRP AUTO,HUMANIS,B2V]",
        },
        {
         condition_solutions: "44,45,46,47,48",
         condition_answers: "14:[CIPAV,CAMIEG,CARCDSF,CNRACL,RSI]",
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
