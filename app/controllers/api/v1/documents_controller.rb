class Api::V1::DocumentsController < Api::V1::BaseController

  before_action :authenticate_user!

  def update
    document = Document.find(params[:id])
    project = document.project
    document.file = params["uploaded_image"]
    if document.save
      render json: project
    end
    authorize project
  end
end










