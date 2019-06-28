class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :url
      t.integer :unread
      t.string :email
      t.string :full_name

      t.timestamps
    end
  end
end
