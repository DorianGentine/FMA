class Advisor < ApplicationRecord
  belongs_to :user
  has_many :projects
  has_many :clients, through: :projects

end
