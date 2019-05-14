class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :file
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
