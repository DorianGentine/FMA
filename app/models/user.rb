class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :advisors, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :projects, through: :clients

end
