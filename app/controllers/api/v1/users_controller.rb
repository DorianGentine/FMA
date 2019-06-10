class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :show ]
  # before_action :authenticate_user!
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
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

end
