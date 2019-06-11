class Api::V1::CalendlyController < Api::V1::BaseController

  def update_calendly
    @project = Project.find(params[:project_id])
    p "//////////////// params event => #{params["payload"]["event"]}"
    p "//////////////// params invitee_start_time_pretty => #{params["payload"]["event"]["invitee_start_time_pretty"]}"
    @project.appointment = params["payload"]["event"]["invitee_start_time_pretty"]
    if @project.save
      render :show
    else
      "//// Error setting => #{@project..errors.full_messages}"
    end
    authorize @project
  end

end











