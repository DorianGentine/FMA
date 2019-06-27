class Api::V1::KitsController < Api::V1::BaseController
  # before_action :authenticate_user!
  acts_as_token_authentication_handler_for User

  def create
    @project = Project.find(params[:project_id])
    kit = Kit.new(project_id: params[:project_id], ressource_id: params[:ressource_id] )
    if kit.save
      render json: @project
    end
    authorize @project
  end

  def destroy
    kit = Kit.find(params[:id])
    @project = kit.project
    kit.destroy
    head :no_content
    authorize @project
  end

end











