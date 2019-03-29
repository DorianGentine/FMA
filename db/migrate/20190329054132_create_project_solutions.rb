class CreateProjectSolutions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_solutions do |t|
      t.references :project, foreign_key: true
      t.references :solution, foreign_key: true

      t.timestamps
    end
  end
end
