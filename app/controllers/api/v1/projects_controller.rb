class Api::V1::ProjectsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    # @user = User.find(params[:id])
    # @projects = @user.projects
    # authorize @user
  end

  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
    # @fma_team = current_user if @user != current_user

    @fma_team = @project.is_his_advisor

    @project.formularies.each do |formulary|
      @solutions = SetSolutions.new(formulary).call
    end

    # CHANGE POLICY FOR PROJECT
    authorize @user
  end

end











