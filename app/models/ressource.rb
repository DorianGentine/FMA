class Ressource < ApplicationRecord
  has_many :kits, dependent: :destroy
  has_many :projects, through: :kits

   mount_uploader :formulary, RessourceUploader
   mount_uploader :notice, RessourceUploader
   mount_uploader :model_2, RessourceUploader
   mount_uploader :model_1, RessourceUploader


end
