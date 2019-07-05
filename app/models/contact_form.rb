class ContactForm < ApplicationRecord
  belongs_to :visitor
  validates :email, uniqueness: true

  after_save :send_email_to_admin

  private

  def send_email_to_admin
    UserMailer.with(user: User.where(admin: true).first, form: self).prise_de_contact.deliver_now
  end
end
