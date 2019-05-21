class Financer < ApplicationRecord

  has_many :acteurs, dependent: :destroy
  has_many :solutions, dependent: :destroy

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = self.name.upcase if self.name && !self.name.blank?
  end

end
