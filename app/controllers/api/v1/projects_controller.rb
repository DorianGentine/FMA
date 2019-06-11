class Api::V1::ProjectsController < Api::V1::BaseController

  before_action :authenticate_user!, except: :update_calendly
  before_action :set_project, only: [:show, :next_setp, :display_hint]


  def show

  end

  def display_hint
    if @project.hint
      @project.hint = false
      @project.save
    end
  end

  def update_calendly
    @project = Project.find(1)
    p "//////////////// params => #{params}"
    p "//////////////// params payload=> #{params["payload"]}"
    p "//////////////// params invitee => #{params["payload"]["invitee"]}"
    authorize @project
  end

  def next_setp
    @project.change_next_step
    @formulary = @project.formularies.first
    @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    render json: @formulary_setted
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end











