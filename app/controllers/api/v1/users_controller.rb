class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  def show
    if @user.client
      @project = @user.projects.first
      @advisor = @project.is_his_advisor
      @solutions = @project.solutions
    elsif @user.advisor
      @url = "https://calendly.com/event_types/user/me"
      @clients = @user.clients
    end
    @statut = @user.client ? "client" : @user.admin ? "admin" : "conseiller"
  end

  def update

  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

end
