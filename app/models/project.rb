class Project < ApplicationRecord
  belongs_to :advisor, optional: true


  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

end
