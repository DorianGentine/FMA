class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create, :update]

  def new
    raise
    @visitor = Visitor.find_or_create_by(user_ip: request.ip)
    if @visitor.contact_form.present?
      @contact = @visitor.contact_form
    else
      @contact = ContactForm.new
    end
    authorize @contact
  end

  def create
    @visitor = Visitor.find_by(user_ip: request.ip)
    @contact = ContactForm.new(form_params)
    @contact.visitor = @visitor
    if @contact.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'contact_form/new' }
        format.js
      end
    end
    authorize @contact
  end

  def update
    @visitor = Visitor.find_by(user_ip: request.ip)
    @contact = @visitor.contact_form
    if @contact.update(form_params)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'contact_form/new' }
        format.js
      end
    end
    authorize @contact
  end

  private

  def form_params
    params.require(:contact_form).permit(:email, :full_name, :description)
  end
end
