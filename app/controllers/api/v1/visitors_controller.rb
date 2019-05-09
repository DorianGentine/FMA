class Api::V1::VisitorsController < Api::V1::BaseController
   before_action :set_visitor, only: [:show]
  def index
    @visitors = policy_scope(Visitor)
  end

  def show

  end

  private

  def set_visitor
    @visitor = Visitor.find(params[:id])
    authorize @visitor  # For Pundit
  end

end
