class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.string :obvious
      t.string :useful
      t.string :reactivity
      t.string :recommend
      t.text :remark
      t.string :satisfy
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
