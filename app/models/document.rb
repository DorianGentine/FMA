class Document < ApplicationRecord
  belongs_to :project

  mount_uploader :url, FileUploader
end
