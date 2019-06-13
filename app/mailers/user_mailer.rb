class UserMailer < ApplicationMailer
  default from: 'your-email@example.com'

  layout 'mailer'

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenu sur Financer mon autonomie')
    # This will render a view in `app/views/user_mailer`!
  end
end
