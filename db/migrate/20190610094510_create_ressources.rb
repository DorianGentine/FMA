class CreateRessources < ActiveRecord::Migration[5.2]
  def change
    create_table :ressources do |t|
      t.string :title
      t.string :description
      t.string :solution_ids
      t.string :financer
      t.string :acteur
      t.string :model_1
      t.string :model_2
      t.string :notice
      t.string :formulary

      t.timestamps
    end
  end
end
