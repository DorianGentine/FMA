class Visitor < ApplicationRecord
  belongs_to :user, optional: true
  has_one :formulary
end
