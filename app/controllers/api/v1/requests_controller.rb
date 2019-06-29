class Api::V1::RequestsController < Api::V1::BaseController
  # before_action :authenticate_user!
  acts_as_token_authentication_handler_for User

  def create
    @project = Project.find(params[:project_id])
    request = Request.new(request_params)
    request.project = @project
    if request.save
      render json: @project
    end
    authorize @project
  end

  def update
    request = Request.find(params[:id])
    @project = request.project
    if request.update(request_params)
      render json: @project
    end
    authorize @project
  end

  private

  def request_params
    params.require(:request).permit(:category, :description, :close)
  end
end











