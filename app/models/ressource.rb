class Ressource < ApplicationRecord
  has_many :kits, dependent: :destroy
  has_many :projects, through: :kits

  mount_uploader :formulary, RessourceUploader
  mount_uploader :notice, RessourceUploader
  mount_uploader :model_2, RessourceUploader
  mount_uploader :model_1, RessourceUploader

  default_scope { order(title: :ASC)}

  after_create :set_to_kit

  private

    def set_to_kit
      if self.request.present?
        req = Request.find(self.request)
        kit = Kit.create(project: req.project, ressource: self )
      end
    end
end
