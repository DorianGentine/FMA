class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :show ]
  # before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]

  def index
    if params[:query]
      sql_query = "last_name LIKE :query OR first_name LIKE :query"
      @users = policy_scope(User).where(sql_query, query: "%#{params[:query]}%")
    else
      @users = policy_scope(User)
    end
  end

  def advisors
    @user = current_user
    advisors = User.where(advisor: true)
    if params[:query]
      sql_query = "last_name LIKE :query OR first_name LIKE :query"
      @advisors = advisors.where(sql_query, query: "%#{params[:query]}%")
    else
      @advisors = advisors
    end
    authorize @user
  end

  def show
    if @user.client
      @project = @user.projects.first
      @advisor = @project.is_his_advisor
      @solutions = @project.solutions
      @url = @advisor.frameworks.first.schedule_url
    elsif @user.advisor
      @clients = @user.his_clients
      @nbr_kits = @user.projects.where(step: "progression")
    elsif @user.admin
      @vis_formulaires  = Visitor.all.map { |e| e.formulary }

      connections = User.clients.map { |e| e.current_sign_in_at.present? ? e.current_sign_in_at : nil }
      @connected = connections.compact.map { |e| e.between?(Time.now.utc, 20.minutes.ago) ? e : nil }
      @unloged = connections.compact.map { |e| e.between?(Time.now.utc, 20.minutes.ago) ? nil : e }
      @inactifs = connections.compact.map { |e| e > 3.week.ago ? e : nil }

      @clients = User.where(client: true)
      @advisors = User.where(advisor: true)
      @nbr_sign_in = Project.all
      @in_progress = Project.all.where.not(step: "archived")
      @archived = Project.all.where(step: "archived")
    end
    @statut = @user.client ? "client" : @user.admin ? "admin" : "conseiller"
  end

  def update
    if params["avatar"].present?
      @user.avatar = params["avatar"]
      @user.save
    end
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email)
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
