class Api::V1::RequestsController < Api::V1::BaseController
  # before_action :authenticate_user!
  acts_as_token_authentication_handler_for User

  def create
    @project = Project.find(params[:project_id])
    kit = Request.new(note_params)
    kit.project = @project
    if kit.save
      render json: @project
    end
    authorize @project
  end

  private

  def note_params
    params.require(:request).permit(:category, :description)
  end
end











