class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @formulary = @user.projects.first.formularies
    @project = @user.projects.first
    authorize @user
  end
end
