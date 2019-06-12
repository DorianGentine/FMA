class UsersController < ApplicationController

  def show
    @current_user = current_user
    @user = User.find(params[:id])
    # if @user.is_a_client
    #   @project = @user.projects.first
    #   @fma_team = @project.is_his_advisor
    #   @formulary = @user.his_formulary
    #   @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    #   @solutions = @project.solutions
    # else
    #   @projects = @user.projects
    #   @clients = @user.his_clients
    # end
    authorize @current_user
  end

end
