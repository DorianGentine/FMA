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
      resource.link_to_project(project) if !project.nil?
    end
  end
end
