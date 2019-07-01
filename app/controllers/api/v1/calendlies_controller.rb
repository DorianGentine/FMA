class Api::V1::CalendliesController < Api::V1::BaseController



  def intercom
    @user = User.find(1)
    p "////////////// ****** conversation_parts ==>>> #{params[:data][:item][:conversation_parts][:conversation_parts]}"
    p "////////////// author #{params[:data][:item][:conversation_parts][:conversation_parts].first[:author]}"
    p "////////////// body #{params[:data][:item][:conversation_parts][:conversation_parts].first[:body]}"
    p "////////////// links #{params[:data][:item][:links][:conversation_web]}"
    "conversation_parts"=>[{"type"=>"conversation_part", "id"=>"3314707457", "part_type"=>"comment", "body"=>
    message = Message.last
    if message.unread > 0
      message.unread = message.unread + 1
    else
      author = params[:data][:item][:conversation_parts][:conversation_parts].last[:author]
      message.update(url: params[:data][:item][:links][:conversation_web], email: author[:email], full_name: author[:name], unread: 1)
    end
    message.save
    UserMailer.with(user: @user,
      message: nil,
      url:params[:data][:item][:links][:conversation_web],
      author: params[:data][:item][:conversation_parts][:conversation_parts].last[:author][:name],
      create_at: Time.now
    ).new_message.deliver_now

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











