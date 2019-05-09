class Api::V1::ContactFormsController < Api::V1::BaseController
  def index
    p "/////////// #{ContactForm.first}"
    @contact_forms = policy_scope(ContactForm)
    # @contact_forms = ContactFrom.all
  end
end
