class Kit < ApplicationRecord
  belongs_to :project
  belongs_to :ressource

  # TODO scope with no request kit
end
