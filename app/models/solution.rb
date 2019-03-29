class Solution < ApplicationRecord
  belongs_to :financer

  has_many :project_solutuions, dependent: :destroy
  has_many :projects, through: :project_solutuions

end
