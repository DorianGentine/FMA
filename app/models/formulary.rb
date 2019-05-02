class Formulary < ApplicationRecord
  belongs_to :visitor
  belongs_to :project


  # Q-1
  def allow_last_name?
    true
  end

  # Q-2
  def allow_first_name?
    true
  end

  # Q-3
  def allow_zip_code?
    true
  end

  # Q-4
  def allow_age?
    true
  end

  # Q-5
  def allow_is_working?
    if self.age.present? && self.age > 1
      return true
    else
      return false
    end
  end

  # Q-6
  def allow_loss_of_autonomy_receipt?
    if self.age.present? && self.age == 2 && self.is_working.present? && self.is_working == 1
      return true
    else
      return false
    end
  end

  # Q-7
  def allow_occupation?
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

  # Q-13
  def allow_type_of_pension?
    if self.age.present? && self.age > 0
      return true
    else
      return false
    end
  end

  # Q-14
  def allow_pension?
    if self.age.present? && self.age > 0 && self.type_of_pension.present? && self.type_of_pension == 1
      return true
    else
      return false
    end
  end

  # Q-15
  def allow_supplementary?
    if self.age.present? && self.age > 0
      return true
    else
      return false
    end
  end

  # Q-16
  def allow_loss_of_autonomy?
    if self.age.present? && self.age > 0
      return true
    else
      return false
    end
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

  # Q-18
  def allow_owner_is_include?
    if self.occupation.present? && self.occupation == 1
      if self.occupant.present? && self.occupant == 1
        return true
      elsif self.occupant.present? && self.occupant == 2 && self.holder_occupation.present? && self.holder_occupation == 1
        return true
      end
    elsif self.occupation.present? && self.occupation == 2 && self.holder_occupation.present? && self.holder_occupation == 2 && self.occupant.present? && self.occupant == 1
      return true
    else
      return false
    end
  end

  # Q-19
  def allow_has_partner?
    if self.type_of_pension.present? && self.type_of_pension == 0 && self.occupant.present? && self.occupant == 1 && self.age.present? && self.age > 0
      return true
    else
      return false
    end
  end

  # Q-20
  def allow_tax_revenue?
    if self.occupant.present? && self.occupant == 0
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

  # Q-21
  def allow_gross_income?
    if self.occupant.present? && self.occupant == 0 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.age > 0
      return true
    elsif self.has_partner.present? && self.has_partner == 1 && self.occupant.present? && self.occupant == 1 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.age > 0
      return true
    else
      return false
    end
  end

  # Q-22
  def allow_global_tax_revenue?
    if self.occupant.present? && self.occupant == 1
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

  # Q-23
  def allow_household_income?
    if self.occupant.present? && self.occupant == 1 && self.type_of_pension.present? && self.type_of_pension == 0 && self.age.present? && self.age > 0
      return true
    else
      return false
    end
  end

  # Q-24
  def allow_owner_tax_revenue?
    if self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 0
      if self.occupant.present? && self.occupant == 1 && self.owner_is_include.present? && self.owner_is_include == 1
        return true
      elsif self.occupant.present? && self.occupant == 0
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

  # Q-25
  def allow_assistant?
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
      if self.finish_step?("is_working") && self.finish_step?("loss_of_autonomy_receipt") &&
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
end
