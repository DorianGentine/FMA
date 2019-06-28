class Request < ApplicationRecord
  belongs_to :project

  after_create :send_notifiaction

private
  def send_notifiaction
    Notification.create(title:"a une demande spécifique", date:Time.now, project: self.project)
  end
end
