class Users::RegistrationsController < Devise::RegistrationsController

  def new
    formulary_id = session[:formulary_id]
    @form = Formulary.find(formulary_id.to_i)
    session[:is_client] = true
    session[:formulary_id] = formulary_id
    super
  end

  def create
    formulary_id = session[:formulary_id]
    project = Formulary.find(formulary_id.to_i).project
    super do |resource|
      advisor = User.where(advisor: true).first
      project.link_to_beneficaire(resource) unless project.in_relationship?(resource)
      project.link_to_advisor(advisor) unless project.in_relationship?(advisor)
    end
  end
end
