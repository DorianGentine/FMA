class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :date
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end
