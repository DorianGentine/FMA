class UsersController < ApplicationController
  before_action :set_user

  def show
    @user = User.find(params[:id])
    if @user.is_a_client
      @project = @user.projects.first
      @fma_team = @project.is_his_advisor
      @formulary = @user.his_formulary
      @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
      @solutions = @project.solutions
    else
      @projects = @user.projects
      @clients = @user.clients
    end
    authorize @user
  end

  def update
    p "user is => #{@user}"
    p "params is => #{params}"
  end

  private


  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
