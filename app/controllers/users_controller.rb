class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @project = @user.projects.first
    @fma_team = @project.is_his_advisor
    # @formulary = @user.projects.first.formularies
    @project = @user.projects.first
    @formulary = Formulary.where(project: @project).first
    authorize @user
  end
end
