class CreateFinancers < ActiveRecord::Migration[5.2]
  def change
    create_table :financers do |t|
      t.string :name
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end