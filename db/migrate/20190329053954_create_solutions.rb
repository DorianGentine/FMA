class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :name
      t.string :group
      t.text :description
      t.references :financer, foreign_key: true

      t.timestamps
    end
  end
end
