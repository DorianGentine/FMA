class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :step
      t.string :appointment
      t.timestamps
    end
  end
end
