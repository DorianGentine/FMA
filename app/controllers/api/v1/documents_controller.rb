class Api::V1::DocumentsController < Api::V1::BaseController

  before_action :authenticate_user!

  def create
    document = Document.new
    project = Project.find(params[:project_id])
    user = User.find(params[:user_id])
    document.file = params["uploaded_image"]
    document.project = project
    if document.save
      render json: document
    end
    # CHANGE POLICY FOR PROJECT
    authorize user
  end
end











