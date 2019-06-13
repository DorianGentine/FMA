class Framework < ApplicationRecord
  belongs_to :user
  before_save :capitalize_title

  private

  def capitalize_title
    title = self.title.capitalize
    self.title = title
  end
end
