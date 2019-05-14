class Project < ApplicationRecord

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  has_many :formularies, dependent: :destroy

  has_many :documents, dependent: :destroy

  enum step: ["validation_data", "documentation", "meeting", "call", "progression", "evalution"]


  def link_to_advisor(user)
    UserProject.create(user: user, project: self)
  end

  def in_relationship?(user)
    return true if UserProject.where(user: user, project: self).first
  end

  def is_his_advisor
    user = UserProject.where(project: self, client: false).first.user
    return user
  end

  def his_client
    user = UserProject.where(project: self, client: true).first.user
    return user
  end
end
