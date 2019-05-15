class Api::V1::DocumentsController < Api::V1::BaseController

  before_action :authenticate_user!

  def create
    document = Document.new
    project = Project.find(params[:project_id])
    user = User.find(params[:user_id])
    p "////: project is => #{project}"
    p "PARAMS =>    >>>>>> #{params["uploaded_image"]}"
    document.file = params["uploaded_image"]
    p "Document with file => #{document.file}"
    document.project = project
    p "Document with project => #{document}"
    if document.save
    p "Document is save"
      render json: document
    else
      p " ////// Document is save"
    end
    # CHANGE POLICY FOR PROJECT
    authorize user
  end
end











