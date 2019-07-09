class Project < ApplicationRecord
  has_many :requests, dependent: :destroy

  has_one :rating, dependent: :destroy

  has_many :notifications, dependent: :destroy
  has_many :notes, dependent: :destroy

  has_many :kits, dependent: :destroy
  has_many :ressources, through: :kits

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects

  has_many :formularies, dependent: :destroy

  has_many :documents, dependent: :destroy

  before_create :fill_step
  before_save :clean_appointment
  before_save :going_to_call

  enum step: ["validation_data", "documentation", "meeting", "call", "progression", "evaluation", "archived"]

  after_create :send_new_member

  def link_to_advisor_and_bene(benef, advisor)
    UserProject.create(user: benef, project: self, client: benef.client)
    UserProject.create(user: advisor, project: self)
    UserMailer.with(user: advisor, client: benef).new_member.deliver_now
    UserMailer.with(user: User.where(admin: true).first, client: benef).new_member.deliver_now
  end

    def send_new_member
  end


  # def link_to_beneficaire(user)
  #   UserProject.create(user: user, project: self, client: user.client)
  # end

  def in_relationship?(user)
    return true if UserProject.where(user: user, project: self).first
  end

  def is_his_advisor
    user = UserProject.where(project: self, client: false).first.user if UserProject.where(project: self, client: false).first.present?
    return user
  end

  def his_client
    user = UserProject.where(project: self, client: true).first.user if UserProject.where(project: self, client: true).first.present?
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
      Notification.create(title:"a validé ses formulaires", date:Time.now, project: self)
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
      SuggestionKit.new(self).call
      UserMailer.with(user: self.his_client).after_appointment.deliver_now
    elsif self.progression?
      self.evaluation!
      Notification.create(title:"a obtenu son kit", date:Time.now, project: self)
      UserMailer.with(user: self.his_client).kit_ready.deliver_now
    elsif self.evaluation?
      self.archived!
      Notification.create(title:"a été archivé", date:Time.now, project: self)
    end
    self.hint = true
    self.save
  end

  private



  def clean_appointment
    if self.documentation?
      self.appointment = nil
    end
  end

  def going_to_call
    if self.meeting?
      self.call! if self.appointment
    end
  end
end

