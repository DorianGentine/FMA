class CreateContactForms < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_forms do |t|
      t.string :email
      t.text :description
      t.references :visitor, foreign_key: true
      t.timestamps
    end
  end
end
