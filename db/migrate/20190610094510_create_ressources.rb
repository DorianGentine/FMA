class CreateRessources < ActiveRecord::Migration[5.2]
  def change
    create_table :ressources do |t|
      t.string :model_1
      t.string :model_2
      t.string :notice
      t.string :formulary

      t.timestamps
    end
  end
end
