class Visitor < ApplicationRecord
  belongs_to :user, optional: true
  has_one :formulary, dependent: :destroy
  has_one :contact_form, dependent: :destroy
end
