class ContactForm < ApplicationRecord
  belongs_to :visitor
  validates :email, uniqueness: true
end
