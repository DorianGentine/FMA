class CreateKits < ActiveRecord::Migration[5.2]
  def change
    create_table :kits do |t|
      t.references :project, foreign_key: true
      t.references :ressource, foreign_key: true

      t.timestamps
    end
  end
end
