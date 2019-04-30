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
    UserProject.create(user: self, project: project)
  end

  private

  def set_as_client
    if !self.admin && !self.advisor
      self.client = true
    end
  end
end
