class Api::V1::CalendliesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :show ]

  def show
    @user = User.find(3)
    p "/// Im in Calendly ///"
    json = { text: "Hello world"}
    render json: json
    authorize @user
  end

end











