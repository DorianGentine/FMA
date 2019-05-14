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


  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects, dependent: :destroy

  def link_to_project(project)
    UserProject.create(user: self, project: project, client: self.client)
  end

  mount_uploader :avatar, PhotoUploader

  def is_a_client
    unless self.advisor || self.admin
      return true
    end
  end

  def clients
    projects = UserProject.where(user: self, client: false)
    clients = []
    projects.each do |user_project|
      clients << user_project.project.his_client
    end

    return clients
  end

  def his_formulary
    if self.is_a_client
      project = self.projects.first
      return formulary = Formulary.where(project: project).first
    end
  end

  private

  def set_as_client
    if !self.admin && !self.advisor
      self.client = true
    end
  end
end
