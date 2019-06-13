class Api::V1::CalendlyController < Api::V1::BaseController

  def update_calendly
    @user = User.find_by(params["payload"]["event"]["invitee"]["email"])

    p "//////////////// User first_name is => #{@user.first_name}"
    @project =  @user.project
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











