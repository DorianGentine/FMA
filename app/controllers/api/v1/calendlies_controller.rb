class Api::V1::CalendliesController < Api::V1::BaseController


  def show
    @user = User.find(1)
    json = { text: "Hello world"}
    render json: json
    authorize @user
  end

  def intercom
    @user = User.find(1)
    p "////////////// params #{params}"
    authorize @user
  end

end











