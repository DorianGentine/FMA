class Api::V1::CalendliesController < Api::V1::BaseController
  # acts_as_token_authentication_handler_for User, except: [ :show ]

  def show
    @user = User.find(3)
    json = { text: "Hello world"}
    render json: json
    authorize @user
  end

  def intercom
    p "////////////// params #{params}"
  end

end











