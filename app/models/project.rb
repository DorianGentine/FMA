class Project < ApplicationRecord

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :formulary, dependent: :destroy

  enum step: ["validation_data", "documentation", "meeting", "call", "progression", "evalution"]

end
