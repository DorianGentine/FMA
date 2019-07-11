class UserMailer < ApplicationMailer
  default from: 'bienvenue@financermonautonomie.fr'

  layout 'mailer'

  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Bienvenue sur Financer mon autonomie')
    # This will render a view in `app/views/user_mailer`!
  end


  def new_request
    @user = params[:user]
    @client = params[:client]
    mail(to: @user.email, subject: 'Nouvelle demande spécifique')
  end

  def new_member
    @user = params[:user]
    @client = params[:client]
    mail(to: @user.email, subject: 'Un nouvel inscrit')
  end

  def appointment
    @user = params[:user]
    @project = params[:project]
    @client = @project.his_client
    mail(to: @user.email, subject: "Votre entretien")
  end

  def new_message
    @user = params[:user]
    @message = params[:message]
    @url = params[:url]
    @author = params[:author]
    @create_at = l(params[:create_at], :format => '%Hh%M')

    mail(to: @user.email, subject: "Un nouveau message de #{@author}")
  end

  def kit_ready
    @user = params[:user]
    mail(to: @user.email, subject: "Votre kit")
  end

  def after_appointment
    @user = params[:user]
    mail(to: @user.email, subject: "Suite à votre entretien")
  end


  def prise_de_contact
    @user = params[:user]
    @form = params[:form]
    mail(to: @user.email, subject: "Prise de contact visiteur")
  end

  def evalution_result
    @user = params[:user]
    @project = params[:project]

    @bene = @project.his_client
    @conseiller = @project.is_his_advisor

    @rating = params[:rating]
    mail(to: @user.email, subject: "Retour évalution")
  end
end















