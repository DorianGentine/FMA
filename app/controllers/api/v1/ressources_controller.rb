class Api::V1::RessourcesController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  # before_action :authenticate_user!

  def index
    @ressources = policy_scope(Ressource)
  end

end




