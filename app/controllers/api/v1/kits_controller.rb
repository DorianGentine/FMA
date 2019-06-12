class Api::V1::KitsController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    kit = Kit.new(project: @project, ressource: params[:ressource_id] )
    if kit.save
      render :json @project
    end
    authorize @project
  end

  def destroy
    kit = Kit.find(params[:id])
    @project = kit.project
    head :no_content
    authorize @project
  end

end











