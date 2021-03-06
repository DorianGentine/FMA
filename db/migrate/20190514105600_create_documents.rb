class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.string :notice
      t.string :file
      t.string :solution_ids
      t.string :formulary_ids
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
