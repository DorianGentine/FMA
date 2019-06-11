class UsersController < ApplicationController

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
      @clients = @user.his_clients
    end
    authorize @user
  end

end
