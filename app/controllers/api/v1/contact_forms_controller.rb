class Api::V1::ContactFormsController < Api::V1::BaseController
  def index
    @contact_forms = policy_scope(ContactForm)
  end
end
