class UsersController < ApplicationController

  def show
      # @connected = 0
      # @unloged = 0
      # @inactifs = 0
      # User.clients.each do |e|
      #   date = e.current_sign_in_at.present? ? e.current_sign_in_at : e.updated_at
      #   if date.between?(Time.now.utc, 20.hours.ago)
      #     @connected += 1
      #   elsif date.between?(Time.now.utc, 20.minutes.ago)
      #     @unloged += 1
      #   elsif date < 3.week.ago
      #     @inactifs += 1
      #   end
      # raise

      # end


    @formulary_setted = FormularyToHash.new(Formulary.first).form_json_for_espace
    @current_user = current_user
    @user = User.find(params[:id])
    # if @user.is_a_client
    #   @project = @user.projects.first
    #   @fma_team = @project.is_his_advisor
    #   @formulary = @user.his_formulary
    #   @formulary_setted = FormularyToHash.new(@formulary).form_json_for_espace
    #   @solutions = @project.solutions
    # else
    #   @projects = @user.projects
    #   @clients = @user.his_clients
    # end
    authorize @current_user
  end

end
