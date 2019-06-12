class Api::V1::CalendlyController < Api::V1::BaseController

  def update_calendly
    @project = Project.find(params[:project_id])
    p "//////////////// params invitee_start_time_pretty => #{params["payload"]["event"]["invitee_start_time_pretty"]}"
    appointment = params["payload"]["event"]["invitee_start_time_pretty"]
    @project.appointment = Time.parse(appointment)
    if @project.save
      render json:@project
    else
      p "//// Error setting date => #{params["payload"]["event"]}"

      p "//// Error setting project => #{@project.errors.full_messages}"
    end
    authorize @project
  end

end











