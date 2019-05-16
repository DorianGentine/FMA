class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update]


  def show
    # TOCHANGE FOR ALL
    @formulary = @project.formularies.first
    @formulary_setted = FormularyToHash.new(@formulary).form_json
    render json: @formulary_setted
  end



  def update

  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end











