class CreateFinancers < ActiveRecord::Migration[5.2]
  def change
    create_table :financers do |t|
      t.string :name
      t.string :logo
      t.string :web
      t.string :phone
      t.text :unmatched
      t.text :description
      t.text :answer

      t.timestamps
    end
  end
end
