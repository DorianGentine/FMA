class UserProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create :create_a_notifiaction

  validates :user, presence: true
  validates :project, presence: true

  private

  def create_a_notifiaction
    Notification.create!(title:"vient de s'inscrire", date:Time.now, project: self.project) if self.client
  end
end
