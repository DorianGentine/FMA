class Financer < ApplicationRecord

  has_many :solutions, dependent: :destroy
  has_many :project_solutions, through: :solutions

  before_save :capitalize_name

  def capitalize_name
    self.name = self.name.upcase if self.name && !self.name.blank?
  end
end
