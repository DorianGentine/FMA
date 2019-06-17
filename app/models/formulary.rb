class Formulary < ApplicationRecord
  belongs_to :visitor, optional: true
  belongs_to :project

  default_scope {order(created_at: :asc)}

  before_create :set_primary
  before_save :add_answer_from_primary_form, :check_zip_change

  geocoded_by :zip_code
  after_validation :geocode

  def first_name=(s)
    write_attribute(:first_name, s.to_s.capitalize) # The to_s is in case you get nil/non-string
  end

  def add_city
    city = Geocoder.search([self.latitude, self.longitude]).first.city
    if city.nil?
      city = Geocoder.search([self.latitude, self.longitude]).first.town
      self.address = city
    else
      self.address = city
    end
  end

  def check_zip_change
    if self.old_zip_code != self.zip_code
      self.add_city
      self.old_zip_code = self.zip_code
    end
  end

  def solutions
    return SetSolutions.new.call(self)
  end
  # Q-2
  def allow_first_name?
    true
  end
  def ask_again_first_name?
    true
  end

  # Q-3
  def allow_zip_code?
    true
  end
  def ask_again_zip_code?
    false
  end

  # Q-4
  def allow_age?
    true
  end
  def ask_again_age?
    true
  end

  # Q-5
  def allow_is_working?
    if self.age.present? && self.set_age_group > 1
      return true
    else
      return false
    end
  end
  def ask_again_is_working?
    true
  end

  # Q-6
  def allow_loss_of_autonomy_receipt?
    if self.age.present? && self.set_age_group == 2 && self.is_working.present? && self.is_working == 1
      return true
    else
      return false
    end
  end
  def ask_again_loss_of_autonomy_receipt?
    true
  end
  # Q-7

  def allow_occupation?
    true
  end
  def ask_again_occupation?
    true
  end

  # Q-8
  def allow_holder_occupation?
    if self.occupation.present? && self.occupation == 1
      return true
    else
      return false
    end
  end

  def ask_again_holder_occupation?
    false
  end

  # Q-9
  def allow_lessor?
    if self.occupation.present? && self.occupation == 2
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 1
      return true
    else
      return false
    end
  end
  def ask_again_lessor?
    false
  end

  # Q-10
  def allow_accommodation?
    if self.occupation.present? && self.occupation == 2
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 1
      return true
    else
      return false
    end
  end
  def ask_again_accommodation?
    false
  end

  # Q-11
  def allow_floor?
    if self.occupation.present? && self.occupation == 2
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 1
      return true
    else
      return false
    end
  end
  def ask_again_floor?
    false
  end

  # Q12
  def allow_accessibility_with_step?
    if self.occupation.present? && self.occupation == 2
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 1
      return true
    else
      return false
    end
  end
  def ask_again_accessibility_with_step?
    false
  end

  # Q-13
  def allow_type_of_pension?
    if self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_type_of_pension?
    true
  end

  # Q-14
  def allow_pension?
    if self.age.present? && self.set_age_group > 0 && self.type_of_pension.present? && self.type_of_pension == 1
      return true
    else
      return false
    end
  end
  def ask_again_pension?
    true
  end
  # Q-15
  def allow_supplementary?
    # raise
    if self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_supplementary?
    true
  end

  # Q-16
  def allow_loss_of_autonomy?
    if self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_loss_of_autonomy?
    true
  end
  # Q-17
  def allow_occupant?
    if self.occupation.present? && self.occupation == 0 || self.occupation == 2 || self.occupation == 3
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 0
      return true
    else
      return false
    end
  end
  def ask_again_occupant?
    false
  end

  # Q-18
  def allow_owner_is_include?
    if self.occupation.present? && self.occupation == 1
      if self.occupant.present? && self.set_nbr_of_occupants == 1
        return true
      elsif self.occupant.present? && self.set_nbr_of_occupants == 2 && self.holder_occupation.present? && self.holder_occupation == 1
        return true
      end
    elsif self.occupation.present? && self.occupation == 2 && self.holder_occupation.present? && self.holder_occupation == 2 && self.occupant.present? && self.set_nbr_of_occupants == 1
      return true
    else
      return false
    end
  end
  def ask_again_owner_is_include?
    false
  end
  # Q-19
  def allow_has_partner?
    if self.type_of_pension.present? && self.type_of_pension == 0 && self.occupant.present? && self.set_nbr_of_occupants == 1 && self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_has_partner?
    false
  end
  # Q-20
  def allow_tax_revenue?
    if self.occupant.present? && self.set_nbr_of_occupants == 0
      if self.occupation.present? && self.occupation == 0
        return true
      elsif self.occupation.present? && self.occupation == 1 &&  self.holder_occupation.present? && self.holder_occupation == 0
        return true
      elsif self.occupation.present? && self.occupation == 3
        return true
      end
    else
      return false
    end
  end
  def ask_again_tax_revenue?
    false
  end
  # Q-21
  def allow_gross_income?
    if self.occupant.present? && self.set_nbr_of_occupants == 0 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.set_age_group > 0
      return true
    elsif self.has_partner.present? && self.has_partner == 1 && self.occupant.present? && self.set_nbr_of_occupants == 1 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_gross_income?
    true
  end
  # Q-22
  def allow_global_tax_revenue?
    if self.occupant.present? && self.set_nbr_of_occupants == 1
      if self.occupation.present? && self.occupation == 0
        return true
      elsif self.occupation.present? && self.occupation == 1 &&  self.holder_occupation.present? && self.holder_occupation == 0
        return true
      elsif self.occupation.present? && self.occupation == 3
        return true
      end
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 2
      return true
    else
      return false
    end
  end
  def ask_again_global_tax_revenue?
    false
  end

  # Q-23
  def allow_household_income?
    if self.occupant.present? && self.set_nbr_of_occupants == 1 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.set_age_group > 0
      return true
    else
      return false
    end
  end
  def ask_again_household_income?
    true
  end

  # Q-24
  def allow_owner_tax_revenue?
    if self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 0
      if self.occupant.present? && self.set_nbr_of_occupants == 1 && self.owner_is_include.present? && self.owner_is_include == 1
        return true
      elsif self.occupant.present? && self.set_nbr_of_occupants == 0
        return true
      else
        return false
      end
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 2 && self.owner_is_include.present? && self.owner_is_include == 2
      return true
    else
      return false
    end
  end
  def ask_again_owner_tax_revenue?
    false
  end
  # Q-25
  def allow_assistant?
    true
  end
  def ask_again_assistant?
    true
  end

  def finish_step?(attribute)
    allow = "allow_" + attribute + "?"
    if self.send(allow) && self.send(attribute).present?
      return true
    elsif self.send(allow) && self.send(attribute).nil?
      return false
    else
      return true
    end
  end

  def is_finish?
    if self.id.nil?
      return false
    else
      if self.age.present? && self.finish_step?("is_working") && self.finish_step?("loss_of_autonomy_receipt") &&
        self.finish_step?("holder_occupation") && self.finish_step?("lessor") && self.finish_step?("accommodation") &&
        self.finish_step?("floor") && self.finish_step?("accessibility_with_step") && self.finish_step?("type_of_pension") &&
        self.finish_step?("pension") && self.finish_step?("supplementary") && self.finish_step?("loss_of_autonomy") &&
        self.finish_step?("occupant") && self.finish_step?("owner_is_include") && self.finish_step?("has_partner") &&
        self.finish_step?("tax_revenue") && self.finish_step?("gross_income") && self.finish_step?("global_tax_revenue") &&
        self.finish_step?("household_income") && self.finish_step?("owner_tax_revenue")
        return true
      else
        return false
      end
    end
  end


  def set_a_new_form(first_name)
    self.first_name = first_name
    self.zip_code = "94000"
    age_values = FormularyChoice::TEST_AGE.values
    hash_choices = FormularyChoice.new.set_collections_formulary
    self.age = age_values[rand(0...age_values.count)]
    if self.allow_is_working?
      self.is_working = hash_choices[:is_working][rand(0...hash_choices[:is_working].count)].second
    end
    if self.allow_loss_of_autonomy_receipt?
      self.loss_of_autonomy_receipt = hash_choices[:loss_of_autonomy_receipt][rand(0...hash_choices[:loss_of_autonomy_receipt].count)].second
    end
    if self.allow_occupation?
      self.occupation = hash_choices[:occupation][rand(0...hash_choices[:occupation].count)].second
    end
    if self.allow_holder_occupation?
      self.holder_occupation = hash_choices[:holder_occupation][rand(0...hash_choices[:holder_occupation].count)].second
    end
    if self.allow_lessor?
      self.lessor = hash_choices[:lessor][rand(0...hash_choices[:lessor].count)]
    end
    if self.allow_accommodation?
      self.accommodation = hash_choices[:accommodation][rand(0...hash_choices[:accommodation].count)].second
    end
    if self.allow_floor?
      self.floor = hash_choices[:floor][rand(0...hash_choices[:floor].count)].second
    end
    if self.allow_accessibility_with_step?
      self.accessibility_with_step = hash_choices[:accessibility_with_step][rand(0...hash_choices[:accessibility_with_step].count)].second
    end
    if self.allow_type_of_pension?
      self.type_of_pension = hash_choices[:type_of_pension][rand(0...hash_choices[:type_of_pension].count)].second
    end
    if self.allow_pension?
      self.pension = hash_choices[:pension][rand(0...hash_choices[:pension].count)]
    end
    if self.allow_supplementary?
      self.supplementary = hash_choices[:supplementary][rand(0...hash_choices[:supplementary].count)]
    end
    if self.allow_loss_of_autonomy?
      self.loss_of_autonomy = hash_choices[:loss_of_autonomy][rand(0...hash_choices[:loss_of_autonomy].count)].second
    end
    if self.allow_occupant?
      self.occupant = rand(1..5)
    end
    if self.allow_owner_is_include?
      self.owner_is_include = hash_choices[:owner_is_include][rand(0...hash_choices[:owner_is_include].count)].second
    end
    if self.allow_has_partner?
      self.has_partner = hash_choices[:has_partner][rand(0...hash_choices[:has_partner].count)].second
    end
    if self.allow_tax_revenue?
      self.tax_revenue = hash_choices[:test_taxe][rand(0...hash_choices[:test_taxe].count)].first
    end
    if self.allow_gross_income?
      self.gross_income = hash_choices[:test_taxe][rand(0...hash_choices[:test_taxe].count)].first
    end
    if self.allow_global_tax_revenue?
      self.global_tax_revenue = hash_choices[:test_taxe][rand(0...hash_choices[:test_taxe].count)].first
    end
    if self.allow_household_income?
      self.household_income = hash_choices[:test_taxe][rand(0...hash_choices[:test_taxe].count)].first
    end
    if self.allow_owner_tax_revenue?
      self.owner_tax_revenue = hash_choices[:test_taxe][rand(0...hash_choices[:test_taxe].count)].first
    end
    if self.allow_assistant?
      self.assistant = hash_choices[:assistant][rand(0...hash_choices[:assistant].count)]
    end
  end

  def verify_zip_code
    if self.zip_code.present?
      self.zip_code.slice(0..1) == "94" ? true : false
    else
      true
    end
  end

  def set_age_group
    return false if self.his_age.nil?
    if self.his_age < 55
      return 0
    elsif self.his_age.between?(56,60)
      return 1
    elsif self.his_age.between?(61,70)
      return 2
    elsif self.his_age > 70
      return 3
    end
  end

  def his_age
    day = self.age.split("/")[0].to_i
    month = self.age.split("/")[1].to_i
    year = self.age.split("/")[2].to_i
    now = Time.now.utc.to_date
    return now.year - year - ((now.month > month || (now.month == month && now.day >= day)) ? 0 : 1)
  end

  def set_nbr_of_occupants
    return false if self.occupant.nil?
    if self.occupant == 1
      return 0
    else
      return 1
    end
  end

  def type_accommodation
    acco = self.accommodation
    choice1 = ["T1", "T2", "T3"]
    if choice1.include?(acco)
      return 0
    else
      return 1
    end
  end

  def dont_ask_again?(column_name)
    if self.project.present?
      false
    end
  end

  private

  def add_answer_from_primary_form
    project = self.project
    first_formulary = Formulary.where(project: project, primary: true)
    first_formulary = first_formulary.first
    if first_formulary.present? && !self.primary

      Formulary.column_names.each do |column_name|
        if  column_name != "id" && column_name != "primary" && column_name != "created_at" && column_name != "updated_at" && column_name != "visitor_id" && column_name != "project_id" && column_name != "old_zip_code" && column_name != "address" && column_name != "latitude" && column_name != "longitude"
          ask_again = "ask_again_" + column_name + "?"
          if !self.send(ask_again)
            self[column_name] = first_formulary[column_name]
          end
        end
      end
    end
    p "self is =W #{self.valid?}"
    p "self is =W #{self.errors.messages}"
  end

  def set_primary
    project = self.project
    if project.nil? || Formulary.where(project: project, primary: true).count < 1
      self.primary = true
    end
  end

end
