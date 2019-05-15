class Document < ApplicationRecord
  belongs_to :project

  mount_uploader :file, FileUploader
end
