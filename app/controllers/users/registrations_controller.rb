# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController



  def new
    formulary_id = session[:formulary_id]
    @form = Formulary.find(formulary_id.to_i)
    session[:is_client] = true
    session[:formulary_id] = formulary_id
    super
  end

  # POST /resource
  def create
    formulary_id = session[:formulary_id]
    @user = User.new(params_user)
    @user.client = true if session[:is_client]
    if @user.save
      project = Formulary.find(formulary_id.to_i).project
      UserProject.create(user: @user, project: project)
      redirect_to user_path(@user)
    else
      render :new
    end
  end



  private

  def params_user
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone,
      :email,
      :password,
      :password_confirmation
    )
  end




end
