class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :category
      t.string :description
      t.boolean :close, :default => false
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
