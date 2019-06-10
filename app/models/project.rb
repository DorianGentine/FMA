class Project < ApplicationRecord

  has_many :notifications, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  has_many :formularies, dependent: :destroy

  has_many :documents, dependent: :destroy

  before_create :fill_step


  enum step: ["validation_data", "documentation", "meeting", "call", "progression", "evalution"]
  # enum progress: ["new", "current", "archive"]

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

  def fill_step
    if self.step.nil?
      self.step = "validation_data"
    end
  end

  def solutions
    return SetSolutions.new.call_for(self)
  end

  def change_next_step
    if self.validation_data?
      self.documentation!
      Notification.create(title:"a valdié ses formulaires", date:Time.now, project: self)
      DocumentAsked.new(self).call
    elsif self.documentation?
      self.meeting!
      Notification.create(title:"a envoyé les documents", date:Time.now, project: self)
    elsif self.meeting?
      self.call!
      Notification.create(title:"a confirmé le rdv", date:Time.now, project: self)
    elsif self.call?
      self.progression!
      Notification.create(title:"a été appelé", date:Time.now, project: self)
    elsif self.progression?
      self.evalution!
      Notification.create(title:"a obtenu son kit", date:Time.now, project: self)
    end
    self.hint = true
    self.save
  end



end

