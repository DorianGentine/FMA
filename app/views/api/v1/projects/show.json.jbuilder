json.project( @project, :id, :created_at, :updated_at)

json.financers @solutions.count

json.formularies @project.formularies, :id, :last_name, :first_name, :zip_code, :age,
      :is_working, :loss_of_autonomy_receipt, :occupation, :holder_occupation, :lessor, :accommodation, :floor,
      :accessibility_with_step, :type_of_pension, :pension, :supplementary, :loss_of_autonomy, :occupant,
      :owner_is_include, :has_partner, :tax_revenue, :gross_income, :global_tax_revenue, :household_income,
      :owner_tax_revenue, :assistant, :updated_at

json.solutions @solutions do |solution|
  json.financer solution.financer, :id, :name, :logo, :description
  json.extract! solution, :id, :background, :category, :group, :name, :answers, :financer_id
end

if current_user.advisor? || current_user.admin?
end

if current_user.admin?
end

