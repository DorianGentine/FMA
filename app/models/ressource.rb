class Ressource < ApplicationRecord
  has_many :kits, dependent: :destroy
  has_many :projects, through: :kits


end
