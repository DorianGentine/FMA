class Project < ApplicationRecord
  belongs_to :advisor, optional: true
  has_one :client
end
