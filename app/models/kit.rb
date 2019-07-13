class Kit < ApplicationRecord
  belongs_to :project
  belongs_to :ressource

  # TODO scope with no request kit
  default_scope { includes(:ressource).order('ressources.title ASC')}
end
