class Api::V1::FormulariesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_project, only: [:update, :create, :edit]

  def edit
    formulary = Formulary.find(params[:id])
    @formulary_setted = FormularyToHash.new(formulary).form_json

    render json: @formulary_setted
  end

  def create
    # ADD params
    formulary = Formulary.new(params)
  end

  def update
    # ADD params
    formulary = Formulary.find(params[:id])
    formulary.update(params)
  end

  def set_project
    @project = Project.find(params[:project_id])
    authorize @project
  end
end




