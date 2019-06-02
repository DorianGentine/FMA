class Api::V1::DocumentsController < Api::V1::BaseController

  before_action :authenticate_user!

  def update
    p "/// Im in"
    p "params is #{params}"
    p "params Uplaod is #{params["uploaded_image"]}"
    document = Document.find(params[:id])
    p "Document is #{document}"
    project = document.project
    document.file = params["uploaded_image"]
    p "//// #{document.valid?}"
    p " #{document.errors.messages}"
    if document.save
      render json: document
    end
    authorize project
  end
end











