class FormularyToHash

  def initialize(form)
    @form = form
  end

  def to_hash_forma
    form_to_hash = {
      0=> @form.project_id,
      # 1=> @form.last_name,
      2=> @form.first_name,
      3=> @form.zip_code,
      4=> @form.age,
      5=> @form.is_working,
      6=> @form.loss_of_autonomy_receipt,
      7=> @form.occupation,
      8=> @form.holder_occupation,
      9=> @form.lessor,
      10=> @form.accommodation,
      11=> @form.floor,
      12=> @form.accessibility_with_step,
      13=> @form.type_of_pension,
      14=> @form.pension,
      15=> @form.supplementary,
      16=> @form.loss_of_autonomy,
      17=> @form.occupant,
      18=> @form.owner_is_include,
      19=> @form.has_partner,
      20=> @form.tax_revenue,
      21=> @form.gross_income,
      22=> @form.global_tax_revenue,
      23=> @form.household_income,
      24=> @form.owner_tax_revenue,
      25=> @form.assistant
    }
    return form_to_hash
  end

  def questions_answers
    Formulary.column_names.map do |column_name|
      question = FormularyChatbot.new().questions[column_name.to_sym]
      if question.present?
        answer = set_answer_for_espace(@form, column_name)
        if answer.present?
          set = {
            question: question,
            answer: answer
          }
        end
      end
    end
  end

  def form_json
     generate_form_with_allow_question(@form, true)
  end

  def form_json_for_espace
    array = []
    generate_form_with_allow_question(@form, false).each do |question|
      column = question[:set_up][:column_name]
      ask_again = "ask_again_" + column + "?"
      if !@form.primary
        # raise if column_name == "is_working"
        array << question if @form.send(ask_again)
      else
        array << question
      end
    end
    return array
  end

  private

  def generate_form_with_allow_question(form, chatbot)
    array = []
    questions_to_ask = FormularyChatbot.new.set_questions_form(chatbot)
      questions_to_ask.each do |key, value|
        if questions_to_ask[key][:question].present?
          allow = "allow_" + key + "?"
          if form.respond_to? key
            hash = { set_up: value, answer: chatbot ? set_answer_for_chatbot(form, key) : set_answer_for_espace(form, key)} if form.try(allow) && form.send(allow)
          else
            hash = { set_up: value, answer: "next", formulary_id: form.id}
          end
          if key == "zip_code" && !form.verify_zip_code
            hash = { set_up: value, answer: chatbot ? set_answer_for_chatbot(form, key) : set_answer_for_espace(form, key)} if form.try(allow) && form.send(allow)
            array << hash
            hash = { set_up: FormularyChatbot.new.wrong_zip_code, answer: nil}
            array << hash
            return array
          else
            array << hash if hash.present?
          end
        end

        end
    return array
  end


  def set_answer_for_espace(form, column_name)
    if form.send(column_name).present?
      if authorize_answer_form?(form, column_name)
        if column_name == "supplementary" || column_name == "assistant"
          first = form.send(column_name).delete! '[]'
          if first.nil?
            form.send(column_name)
          else
            first.gsub('"', '')
          end
        else
          form.send(column_name)
        end
      else
        FormularyChoice.new.set_collections_formulary[column_name.to_sym][form.send(column_name)].first
      end
    else
      return nil
    end
  end

  def set_answer_for_chatbot(form, column_name)
    if form.send(column_name).present?
      if authorize_answer_form?(form, column_name)
        if column_name == "supplementary" || column_name == "assistant"
          first = form.send(column_name).delete! '[]'
          if first.nil?
            form.send(column_name)
          else
            first.gsub('"', '')
          end
        elsif column_name == "zip_code"
          form.address + ", " + form.zip_code
        elsif column_name == "age"
          "#{form.age}, j'ai #{form.his_age} ans"
        else
          form.send(column_name)
        end
      else
        FormularyChoice.new.set_collections_formulary[column_name.to_sym][form.send(column_name)].first
      end
    else
      return nil
    end
  end

  def authorize_answer_form?(form, column_name)
    true if form.send(column_name).is_a?(String) || column_name == "occupant" || column_name == "tax_revenue" || column_name == "gross_income" || column_name == "global_tax_revenue" || column_name == "household_income"|| column_name == "owner_tax_revenue"
  end
end












