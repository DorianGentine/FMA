class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :notice
      t.string :file
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
