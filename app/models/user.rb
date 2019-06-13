class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :first_name, :message => "Ton prénom doit être rempli"
  validates_presence_of :last_name, :message => "Ton nom doit être rempli"
  validates_presence_of :phone, :message => "Ton téléphone doit être rempli"
  validates_presence_of :email, :message => "Ton email doit être rempli"

  before_create :set_as_client
  after_create :send_welcome_email

  scope :clients, -> { User.where(client: true) }

  acts_as_token_authenticatable

  has_many :frameworks, dependent: :destroy

  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy
  has_many :notifications, through: :projects, dependent: :destroy

  def link_to_project(project)
    UserProject.create(user: self, project: project, client: self.client)
  end

  mount_uploader :avatar, PhotoUploader


  def is_a_client
    unless self.advisor || self.admin
      return true
    end
  end

  def name
    p "#{self.first_name} #{self.last_name}"
  end

  def his_clients
    user_projects = UserProject.where(user: self, client: false)
    clients = []
    user_projects.each do |user_project|
      clients << user_project.project.his_client
    end
    return clients
  end

  def project
    if self.is_a_client
      return self.projects.first
    end
  end

  def his_formulary
    if self.is_a_client
      project = self.projects.first
      return formulary = Formulary.where(project: project, primary: true).first
    end
  end

  private

  def set_as_client
    if !self.admin && !self.advisor
      self.client = true
    end
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_later
  end

end
