class Api::V1::VisitorsController < Api::V1::BaseController

  def index
    @visitors = policy_scope(Visitor)
  end




end
