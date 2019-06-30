class Api::V1::CalendliesController < Api::V1::BaseController



  def intercom
    @user = User.find(1)
    p "////////////// author #{params[:data][:item][:conversation_parts][:conversation_parts].last[:author]}"
    p "////////////// links #{params[:data][:item][:links]}"
    message = Message.last
    if message.unread > 0
      message.unread = message.unread + 1
    else
      author = params[:data][:item][:conversation_parts][:conversation_parts].last[:author]
      message.update(url: params[:data][:item][:links][:conversation_web], email: author[:email], full_name: author[:name], unread: 1)
    end
    message.save
    authorize @user
  end

  def restart_compteur
    @user = User.find(1)
    message = Message.last
    message.unread = 0
    message.url = "https://app.intercom.io/a/apps/pfhokn92/inbox/inbox/all/"
    message.email = nil
    message.full_name = nil
    message.save
    authorize @user
  end
end











