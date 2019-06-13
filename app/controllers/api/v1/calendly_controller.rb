class Api::V1::CalendlyController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def update_calendly
    @user = current_user
    p "//////////////// User first_name is => #{@user.first_name}"
    @project = Project.find(params[:project_id])
    p "//////////////// project id is => #{@project.id}"
    p "//////////////// params invitee_start_time_pretty => #{params["payload"]["event"]["invitee_start_time_pretty"]}"
    appointment = params["payload"]["event"]["invitee_start_time_pretty"]
    @project.appointment = Time.parse(appointment)
    p "//////////////// project appointment is => #{@project.appointment}"
    if @project.save
    p "//////////////// project is save"
      render json:@project
    else
      p "//// Error setting date => #{params["payload"]["event"]}"

      p "//// Error setting project => #{@project.errors.full_messages}"
    end
    authorize @project
  end

end











