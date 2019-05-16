class Acteur < ApplicationRecord
  belongs_to :financer

  scope :list_of, -> (financer_name) { joins(:financer).where(financers: {name: financer_name })}

  def name=(s)
    write_attribute(:name, s.to_s.upcase) # The to_s is in case you get nil/non-string
  end

end
