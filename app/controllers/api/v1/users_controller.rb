class Api::V1::FormulariesController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  def show
    # @formulary = @user.projects.first.formulary
    @project = @user.projects.first
  end

  def update

  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
