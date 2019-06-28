class Api::V1::RessourcesController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  # before_action :authenticate_user!

  def index
    @ressources = policy_scope(Ressource)
  end

  def update
    ressource = Ressource.find(params[:id])
    if ressource.update(ressource_params)
      render json: ressource
    end
    authorize ressource
  end

  def create
    ressource = Ressource.new(ressource_params)
    if ressource.save
      render json: ressource
    else
      render_error
    end
    authorize ressource
  end

  def destroy
    ressource = Ressource.find(params[:id])
    ressource.destroy
    head :no_content
    authorize ressource
  end

  private


  def ressource_params
    params.require(:ressource).permit(:title, :desciption, :formulary, :notice, :model_1, :model_2)
  end
end




