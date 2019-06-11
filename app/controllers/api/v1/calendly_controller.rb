class Api::V1::CalendlyController < Api::V1::BaseController

  def update_calendly
    @project = Project.find(params[:project_id])
    p "//////////////// params => #{params}"
    p "//////////////// params payload=> #{params["payload"]}"
    p "//////////////// params invitee => #{params["payload"]["invitee"]}"
    authorize @project
  end

end











