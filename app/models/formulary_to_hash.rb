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


  def form_json
     generate_form_with_allow_question(@form)
  end

  private

  def generate_form_with_allow_question(form)
    array = []
    FormularyChoice.new.set_questions_form.each do |key, value|
      allow = "allow_" + key + "?"
      if form.respond_to? key
        hash = { set_up: value, answer: set_answer(form, key, allow)} if form.try(allow) && form.send(allow)
      else
        hash = { set_up: value, answer: "next" }
      end
      array << hash if hash.present?
    end
    return array
  end


  def set_answer(form, column_name, allow)
    if form.send(column_name).present?
      if form.send(column_name).is_a?(String)
        form.send(column_name)
      else
        FormularyChoice.new.set_collections_formulary[column_name.to_sym][form.send(column_name)].first
      end
    else
      return nil
    end
  end
end












