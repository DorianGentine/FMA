json.formulary(@formulary, :id, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant)


json.solutions @solutions do |solution|
  json.financer solution.financer, :id, :name, :logo, :description
  json.extract! solution, :id, :background, :category, :group, :name, :answers, :financer_id
end
