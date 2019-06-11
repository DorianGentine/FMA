class CreateFrameworks < ActiveRecord::Migration[5.2]
  def change
    create_table :frameworks do |t|
      t.string :title
      t.string :url
      t.string :logo
      t.string :token
      t.float :user_id

      t.timestamps
    end
  end
end
