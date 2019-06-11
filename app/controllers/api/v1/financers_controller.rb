class Api::V1::FinancersController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User
  # before_action :authenticate_user!

  def index
    @financers = policy_scope(Financer)
  end
  def show
    @financer = Financer.find(params[:id])
    authorize @financer
  end

end
