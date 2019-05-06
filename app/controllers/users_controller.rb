class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @formulary = @user.projects.first.formularies
    @project = @user.projects.first
    @formulary = Formulary.where(project: @project).first
    authorize @user
  end
end
