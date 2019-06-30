class UserMailer < ApplicationMailer
  default from: 'donatien@rollandmail.com'

  layout 'mailer'

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenu sur Financer mon autonomie')
    # This will render a view in `app/views/user_mailer`!
  end


  def new_request
    @user = params[:user]
    @client = params[:client]
    mail(to: @user.email, subject: 'Nouvelle demande spécifique')
  end
end
