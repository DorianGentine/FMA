class Api::V1::KitsController < Api::V1::BaseController
  # before_action :authenticate_user!
  acts_as_token_authentication_handler_for User

  def create
    p "Coucou I'm in with #{params}"
    @project = Project.find(params[:project_id])
    p "Coucou I'm in with project #{@project}"
    p "Coucou I'm in with ressource_id is #{params[:ressource_id]}"
    kit = Kit.new(project_id: params[:project_id], ressource_id: params[:ressource_id] )
    p "Kit is #{kit}"
    if kit.save
    p "Kit is created #{kit}"
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











