class ChangeRequestToBeIntegerInRessources < ActiveRecord::Migration[5.2]
  def change
    change_column :ressources, :request, :string
  end
end
