class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
