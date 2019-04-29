class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    raise
    formulary_id = session[:formulary_id]
    @form = Formulary.find(formulary_id)
    session[:is_client] = true
    session[:formulary_id] = formulary_id
  end

  # POST /resource
  def create
    raise
    formulary_id = session[:formulary_id]
    @user = User.new(params_user)
    @user.client = true if session[:is_client]
    if @user.save
      raise
      project = Formulary.find(formulary_id).project
      UserProject.create(user: @user, project: project)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  private

  def params_user
    params.require(:user).permit(
      :last_name,
      :first_name,
      :phone,
      :email,
      :password,
      :password_confirmation
    )
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
