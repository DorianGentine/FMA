class CreateActeurs < ActiveRecord::Migration[5.2]
  def change
    create_table :acteurs do |t|
      t.string :name
      t.string :web
      t.string :phone
      t.string :logo
      t.references :financer, foreign_key: true

      t.timestamps
    end
  end
end
