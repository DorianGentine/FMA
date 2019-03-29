class Formulary < ApplicationRecord
  belongs_to :visitor
  belongs_to :project

  LESSOR_NAMES = ["BATIGERE", "CDC HABITAT", "COOPERER POUR HABITER", "DOMNIS", "FRANCE HABITATION", "FOYER SOLEIL", "I3F", "ICADE IPM",
  "ICADE IPM", "IN'LI QWACIO", "KREMLIN BICETRE HABITAT", "LA SEMISE", "LOGIAS", "LOGIAL OPH",
  "MAISONS ALFORT HABITAT", "NOVIGERE", "OPALY", "OPH GENTILLY", "OPH L'HAY LES ROSES", "OPH VILLEJUIF", "OPH VITRY", "OPH IVRY",
  "OSICA", "RATP HABITAT", "RESIDENCE LE LOGEMENT DES FONCTIONNAIRES", "SIEMP", "VALOPHIS", "Autre" ]

  PENSION_NAMES = [ "CAMIEG", "CNRACL", "RSI", "CARCDSF", "Autre"]

  SUPPLEMENTARY_NAMES = [ "Aucune caisse de retraite complémentaire ne me verse de pension de retraite complémentaire ou de reversion",
  "AG2R", "B2V", "HUMANIS", "IRCANTEC", "KLESIA", "MALAKOFFF MEDERIC", "PROBTP", "AUDIENS", "IRP AUTO", "LOURMEL", "Autre : Libre"]

  AGE = {
    0 => "0- Strictement inférieur à 55 ans",
    1 => "1- De 56 à 60 ans",
    2 => "2- De 61 à 75 ans",
    3 => "3- Strictement supérieur à 75 ans"
  }

  OCCUPATION_CHOICES = {
    0 => "0- Propriétaire occupant",
    1 => "1- Occupant à titre gratuit",
    2 => "2- Locataire du parc social",
    3 => "3- Locataire du parc privé",
    4 => "4- Hébergé en famille d'accueil"
  }

  HOLDER_OCCUPATION_CHOICES = {
    0 => "0- Propriétaire occupant",
    1 => "1- Locataire du parc social",
    2 => "2- Locataire du parc privé"
  }
  ACCOMMODATION = {
    0 => "0- T1, T2 ou T3",
    1 => "1- Strictement supérieur au T3"
  }

  FLOOR = {
    0 => "0- Étage",
    1 => "1- Rez de chaussée"
  }

  TYPE_OF_PENSION = {
    0 => "0- Je perçois à titre principal une pension de retraite ou de réversion de la CNAV",
    1 => "1- Je perçois à titre principal une pension de retraite ou de réversion d'un autre organisme que la CNAV",
    2 => "2- Je ne perçois aucune pension de retraite ou de réversion à titre principal"
  }

  LOSS_OF_AUTONOMY = {
    0 => "0- Strictement supérieur à 4",
    1 => "1- Inférieur ou égale à 4",
    2 => "2- J'ai disposé d'une évaluation de mon GIR mais je ne le connais plus",
    3 => "3- Je ne dispose d'aucun GIR"
  }

  OCCUPANT = {
    0 => "0- J'habite seul",
    1 => "1- Au moins 1 autre personne compose mon foyer"
  }

  TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  GROSS_INCOME = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Supérieur ou égal à A"
  }

  GLOBAL_TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  HOUSEHOLD_INCOME = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Supérieur ou égal à A"
  }

  OWNER_TAXE_REVENUE = {
    0 => "0- Strictement inférieur à A",
    1 => "1- Entre A et B",
    2 => "2- Supérieur ou égal à B"
  }

  ASSISTANT = {
    0 => "0- Prêt à taux 0 au cours des 5 dernières années",
    1 => "1- Aide pour l'adaptation du logement via l'APA",
    2 => "2- PCH",
    3 => "3- Dispositif d'action social auprès d'une caisse de retraite principale",
    4 => "4- Subvention de l'ANAH au cours des 5 dernières années",
    5 => "5- Non"
  }

  YES_NO = {
    0 => "0- Oui",
    1 => "1- Non"
  }

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
    if self.type_of_pension.present? && self.type_of_pension == 0 && self.occupant.present? && self.occupant == 1 && self.age.present? && self.age > 1
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
    if self.occupation.present? && self.occupation == 2 && self.holder_occupation.present? && self.holder_occupation == 0 && self.occupant.present? && self.occupant == 1 && self.owner_is_include.present? && self.owner_is_include == 1
      return true
    elsif self.occupation.present? && self.occupation == 1 && self.holder_occupation.present? && self.holder_occupation == 2 && self.owner_is_include.present? && self.owner_is_include == 2
      return true
    else
      return false
    end
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
