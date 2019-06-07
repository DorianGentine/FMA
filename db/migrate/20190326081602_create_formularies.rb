class CreateFormularies < ActiveRecord::Migration[5.2]
  def change
    create_table :formularies do |t|
      t.boolean :primary, :default => false
      t.references :visitor, foreign_key: true
      t.references :project, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :first_name
      t.string :zip_code
      t.string :age
      t.integer :is_working
      t.integer :loss_of_autonomy_receipt
      t.integer :occupation
      t.integer :holder_occupation
      t.string :lessor
      t.integer :accommodation
      t.integer :floor
      t.integer :accessibility_with_step
      t.integer :type_of_pension
      t.string :pension
      t.string :supplementary
      t.integer :loss_of_autonomy
      t.integer :occupant
      t.integer :owner_is_include
      t.integer :has_partner
      t.integer :tax_revenue
      t.integer :gross_income
      t.integer :global_tax_revenue
      t.integer :household_income
      t.integer :owner_tax_revenue
      t.string :assistant
      t.timestamps
    end
  end
end

