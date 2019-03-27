class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :user_ip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
