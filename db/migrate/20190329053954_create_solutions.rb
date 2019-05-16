class CreateSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :solutions do |t|
      t.string :background
      t.string :category
      t.string :group
      t.string :name
      t.string :conditions
      t.references :financer, foreign_key: true
      t.timestamps
    end
  end
end
