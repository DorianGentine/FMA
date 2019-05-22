class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :next_setp]
  before_action :set_project_view, only: [:show]


  def show
  end

  def next_setp
    @project.change_next_step
    @formulary = @project.formularies.first
    @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    render json: @formulary_setted
  end

  private

  def set_project_view
    @formulary = @project.formularies.first
    @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    render json: @formulary_setted
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end











