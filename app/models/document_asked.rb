class DocumentAsked

  def initialize(project)
    @project = project
    @solutions = @project.solutions
    @formularies = @project.formularies
  end

  def call
    @project.documents.destroy_all
    documents.each do |document|
      if validation_of_creation(document)
        if document === type_document_4
          set_solution_ids_and_formulary_ids(document)[:formulary_ids].split(", ").each do |id|
            doc_id = create_document(document).id
            doc = Document.find(doc_id)
            doc.formulary_ids = id
            doc.save
          end
        else
          if Document.where(project: @project, description: document[:description]).count < 1
            create_document(document)
          end
        end
      end
    end
  end

  private

  def create_document(document)
    return Document.create(project: @project, title: document[:title],
      description: document[:description], notice: document[:notice],
      solution_ids: set_solution_ids_and_formulary_ids(document)[:solution_ids],
      formulary_ids: set_solution_ids_and_formulary_ids(document)[:formulary_ids]
      )
  end

  def documents
    return [ type_document_1, type_document_2, type_document_3, type_document_4]
  end

  def validation_of_creation(document)
    formulary_answers = []
    solution_answers = []
    document[:conditions].each do |condition|
      if !scan_each_conditions_by_formulary(condition).nil? && !scan_each_conditions_by_project(condition).nil?
        return true
      elsif !scan_each_conditions_by_formulary(condition).nil? && scan_each_conditions_by_project(condition).nil?
        return true
      elsif scan_each_conditions_by_formulary(condition).nil? && !scan_each_conditions_by_project(condition).nil?
        return true
      end
    end
    return false
  end

  def set_solution_ids_and_formulary_ids(document)
    hash = {}
    document[:conditions].each do |condition|
      if !scan_each_conditions_by_formulary(condition).nil? && !scan_each_conditions_by_project(condition).nil?
        hash[:solution_ids] = hash[:solution_ids].nil? ? scan_each_conditions_by_project(condition) : hash[:solution_ids] + ", " + scan_each_conditions_by_project(condition)
        hash[:formulary_ids] = hash[:formulary_ids].nil? ? scan_each_conditions_by_formulary(condition) : hash[:formulary_ids] + ", " + scan_each_conditions_by_formulary(condition)
      elsif !scan_each_conditions_by_formulary(condition).nil? && scan_each_conditions_by_project(condition).nil?
        hash[:formulary_ids] = hash[:formulary_ids].nil? ? scan_each_conditions_by_formulary(condition) : hash[:formulary_ids] + ", " + scan_each_conditions_by_formulary(condition)
      elsif scan_each_conditions_by_formulary(condition).nil? && !scan_each_conditions_by_project(condition).nil?
        hash[:solution_ids] = hash[:solution_ids].nil? ? scan_each_conditions_by_project(condition) : hash[:solution_ids] + ", " + scan_each_conditions_by_project(condition)
      end
    end
    hash[:solution_ids] = hash[:formulary_ids].present? ? hash[:solution_ids].split(', ').uniq.join(', ') : nil
    hash[:formulary_ids] = hash[:formulary_ids].present? ? hash[:formulary_ids].split(', ').uniq.join(', ') : nil
    return hash
  end


  def scan_each_conditions_by_project(condition)
    if scan_document_by_solution(condition) != false && scan_document_by_solution(condition).count > 0
      return scan_document_by_solution(condition).to_s.gsub("[", "").gsub("]", "")
    end
  end

  def scan_each_conditions_by_formulary(condition)
    if scan_document_by_answer(condition) != false && scan_document_by_answer(condition).count > 0
      return scan_document_by_answer(condition).uniq.to_s.gsub("[", "").gsub("]", "")
    end
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
    formulary_id = []
    @formularies.each do |form|
      json_form = FormularyToHash.new(form).to_hash_forma
      condition_needed.each do |key, value|
    # raise if condition_needed ==  "7:1&8:1&9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FOYER SOLEIL,FRANCE HABITATION,LA SEMISE,OPH L'HAY LES ROSES,LOGIAL OPH,MAISONS ALFORT HABITAT,OPALY,OPH IVRY,OPH VILLEJUIF,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP, CRETEIL HABITAT,I3F,INLI QWACIO]"
        if json_form[key].present?
          if json_form[key] == value || value.to_s.include?(json_form[key].to_s)
            formulary_id << form.id
          end
        end
      end
    end
    return formulary_id.count > 0 ? formulary_id : false
  end

  def set_condition(conditions)
    array_conditions = conditions.split("&").map {|e| e.split(":")}
    new_condition = {}
    array_conditions.each do |condition|
      value = condition.second.gsub("[", "").gsub("]", "").gsub(",", ", ")
      set_value = value.to_i.to_s == value ? value.to_i : value
      new_condition[condition.first.to_i] = set_value
    end
    return new_condition
  end

  def type_document_1
    {
      title: "Avis situation déclarative impot revenu",
      description: "Dernier avis de situation déclarative à l'impôt sur le revenu de votre foyer",
      notice: "https://res.cloudinary.com/financermonautonomie/image/upload/v1558508261/exemple_documents_a_demander/Avis_situation_declarative_impot_revenu_dfgfoq.pdf",
      conditions: [
        {
         condition_solutions: "1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25&26&27&28",
         condition_answers: nil,
        },
        {
         condition_solutions: "61",
         condition_answers: "15:[IRCANTEC,AG2R,IRP AUTO,HUMANIS]",
        },
        {
         condition_solutions: "44&45&46&47&48",
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
         condition_solutions: "3&6&9&10&13&14&17&20&23&24&27&28",
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
         condition_solutions: "1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16&17&18&19&20&21&22&23&24&25&26&27&28",
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
         condition_solutions: "1&4&7&11&15&18&21&25&60&3&6&9&10&13&14&17&20&23&24&27&28",
         condition_answers: nil,
        },
        {
         condition_solutions: nil,
         condition_answers: "7:2&9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FOYER SOLEIL,FRANCE HABITATION,LA SEMISE,OPH L'HAY LES ROSES,LOGIAL OPH,MAISONS ALFORT HABITAT,OPALY,OPH IVRY,OPH VILLEJUIF,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP, CRETEIL HABITAT,I3F,INLI QWACIO]",
        },
        {
         condition_solutions: nil,
         condition_answers: "7:1&8:1&9:[BATIGERE,CDC HABITAT,COOPERER POUR HABITER,DOMNIS,FOYER SOLEIL,FRANCE HABITATION,LA SEMISE,OPH L'HAY LES ROSES,LOGIAL OPH,MAISONS ALFORT HABITAT,OPALY,OPH IVRY,OPH VILLEJUIF,OSICA,RATP HABITAT,RESIDENCE LE LOGEMENT DES FONCTIONNAIRES,SIEMP, CRETEIL HABITAT,I3F,INLI QWACIO]",
        },
        {
         # condition_solutions: nil,
         condition_solutions: "61",
         condition_answers: "15:[AG2R,IRP AUTO,HUMANIS,B2V]",
        },
        {
         condition_solutions: "44,45,46,47,48",
         condition_answers: "14:[CIPAV,CAMIEG,CARCDSF,CNRACL,RSI]",
        }
      ]
    }
  end

end
