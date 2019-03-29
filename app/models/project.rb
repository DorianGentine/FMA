class Project < ApplicationRecord
  belongs_to :advisor, optional: true
  has_one :client

  has_many :project_solutuions, dependent: :destroy
  has_many :solutions, through: :project_solutuions

end
