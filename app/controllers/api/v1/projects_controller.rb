class Api::V1::ProjectsController < Api::V1::BaseController

  before_action :authenticate_user!
  before_action :set_project, only: [:show, :next_setp, :display_hint, :download_zip]

  def index
    @projects = policy_scope(Project)
  end

  def show

  end

  def display_hint
    if @project.hint
      @project.hint = false
      @project.save
    end
  end

  def next_setp
    p "params is => #{params}"
    if params[:archived].present? && params[:archived]
      @project.archived!
      Notification.create(title:"a été archivé", date:Time.now, project: @project)
    else
      @project.change_next_step
    end
    @formulary = @project.formularies.first
    @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    render json: @formulary_setted
  end

  def download_zip

  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end











