class Api::V1::DocumentsController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def create
    document = Document.new
    project = Project.find(params[:project_id])
    p "////: project is => #{project}"
    document.file = params["uploaded_file"]
    p "Document with file => #{document}"
    document.project = project
    p "Document with project => #{document}"
    if document.save
    p "Document is save"
      render json: document
    else
      p " ////// Document is save"
    end
  end
end











