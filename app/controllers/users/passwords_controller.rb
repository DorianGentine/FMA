class Users::PasswordsController < Devise::PasswordsController
  # acts_as_token_authentication_handler_for User, except: [ :show ]

  # def update
  #   user = User.with_reset_password_token(params[:reset_password_token])
  #   if user&.update(password_params)
  #     render json: user, status: :ok
  #   else
  #     render json: {error: ['Password update failed']}, status: :internal_server_error
  #   end
  # end

  # private

  # def password_params
  #   params.permit(:password)
  # end
end
