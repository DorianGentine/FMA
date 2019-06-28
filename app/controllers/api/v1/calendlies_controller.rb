class Api::V1::CalendliesController < Api::V1::BaseController


  def show
    @user = User.find(1)
    json = { text: "Hello world"}
    render json: json
    authorize @user
  end

  def intercom
    @user = User.find(1)
    p "////////////// data #{params[:data]}"
    p "////////////// item #{params[:data][:item]}"
    p "////////////// author #{params[:data][:item][:conversation_parts][:conversation_parts][:author]}"
    p "////////////// links #{params[:data][:item][:links]}"
    message = Message.last
    if message.unread > 0
      message.unread = message.unread + 1
    else
      author = params[:data][:item][:conversation_parts][:conversation_parts][:author]
      message.update(url: params[:data][:item][:links][:conversation_web], email: author[:email], full_name: author[:name])
    end
    message.save
    authorize @user
  end

end











