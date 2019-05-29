class UsersController < ApplicationController

  def show


    @user = User.find(params[:id])
    if @user.is_a_client
      @project = @user.projects.first
      @fma_team = @project.is_his_advisor
      @formulary = @user.his_formulary
      @solutions = @project.solutions
    else
      @projects = @user.projects
      @clients = @user.clients
    end


    DocumentAsked.new(@project).call
    authorize @user
  end

  def conseiller
    @user = User.find(params[:id])
    authorize @user
  end

end
